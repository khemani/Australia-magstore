<?php
class Myocpod {
	private $pods = array();
	
	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->tax = $registry->get('tax');
		$this->currency = $registry->get('currency');

		$extension_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE type = 'module' AND code = 'myocpod'");

		if($extension_query->num_rows) {
			if ($this->customer->isLogged()) {
				$customer_group_id = $this->customer->getCustomerGroupId();
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}

			$pod_setting_query = $this->db->query("SELECT pods.*,po.product_id FROM " . DB_PREFIX . "myoc_pod_setting pods LEFT JOIN " . DB_PREFIX . "product_option po ON (po.product_option_id = pods.product_option_id)");

			if($pod_setting_query->num_rows)
			{
				foreach($pod_setting_query->rows as $pod_setting) {
					if(!isset($this->pods[$pod_setting['product_option_id']])) {
						$this->pods[$pod_setting['product_option_id']] = array(
							'show_price_product'	=> $pod_setting['show_price_product'],
							'show_price_cart'		=> $pod_setting['show_price_cart'],
							'show_final'			=> $pod_setting['show_final'],
							'table_style'			=> $pod_setting['table_style'],
							'price_format'			=> $pod_setting['price_format'],
							'qty_column'			=> $pod_setting['qty_column'],
							'qty_format'			=> $pod_setting['qty_format'],
							'stock_column'			=> $pod_setting['stock_column'],
							'qty_cart'				=> $pod_setting['qty_cart'],
							'flat_rate'				=> $pod_setting['flat_rate'],
							'product_id'			=> $pod_setting['product_id'],
							'quantities'			=> array(),
							'pods'					=> array(),
						);
					}
					$pod_query = $this->db->query("SELECT pod.* FROM " . DB_PREFIX . "myoc_pod pod LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (pov.product_option_value_id = pod.product_option_value_id) WHERE pod.customer_group_id = '" . (int)$customer_group_id . "' AND pov.product_option_id = '" . (int)$pod_setting['product_option_id'] . "' ORDER BY pod.priority, pod.quantity");
					if($pod_query->num_rows)
					{
						foreach($pod_query->rows as $pod) {
							if(!isset($this->pods[$pod_setting['product_option_id']]['pods'][$pod['product_option_value_id']])) {
								$this->pods[$pod_setting['product_option_id']]['pods'][$pod['product_option_value_id']] = array();
							}
							$this->pods[$pod_setting['product_option_id']]['pods'][$pod['product_option_value_id']][$pod['quantity']] = $pod;
							$this->pods[$pod_setting['product_option_id']]['quantities'][$pod['quantity']] = $pod['quantity'];
						}
					}
				}
			}
		}//print_r($this->pods);		
	}

	public function getPod($product_option_id) {
		if(!empty($this->pods) && isset($this->pods[$product_option_id]))
		{
			return $this->pods[$product_option_id];
		}
		return false;
	}

	public function showPod($product_option_id) {
		if($this->getPod($product_option_id))
		{
			return $this->pods[$product_option_id]['show_price_product'];
		}
		return false;
	}

	public function isQtyCart($product_id) {
		$po_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
		if($po_query->num_rows) {
			foreach ($po_query->rows as $product_option) {
				if($this->getPod($product_option['product_option_id'])) {
					if ($this->pods[$product_option['product_option_id']]['qty_cart']) {
						return true;
					}
				}
			}
		}
		return false;
	}

	public function getOptionData($option_data, $product_base_price, $qty) {
		foreach ($option_data as $option_id => $option) {
			if($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image')
			{
				$option_data[$option_id] = array_merge($option, $this->getOptionValueDiscount($option['product_option_value_id'], $product_base_price, $qty));
				if($this->getPod($option_data[$option_id]['product_option_id']) && !$this->pods[$option_data[$option_id]['product_option_id']]['show_price_cart'])
				{
					$option_data[$option_id]['price'] = false;
				}
			}
		}
		return $option_data;
	}

	public function getOptionPrice($option_data, $product_base_price, $qty, $special = true) {
		$option_price = 0;
		foreach ($option_data as $option_id => $option) {
			if($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image')
			{
				 $pod = $this->getOptionValueDiscount($option['product_option_value_id'], $product_base_price, $qty);
				//echo  $option_price .'='. $pod['special'];
				if($pod['special'] !== false && $special) {
					if($pod['special_prefix'] == '+') {
						$option_price += $pod['special'];
					} elseif($pod['special_prefix'] == '-') {
						$option_price -= $pod['special'];
					}
				} else {
					if($pod['price_prefix'] == '+') {
						$option_price += $pod['price'];
					} elseif($pod['price_prefix'] == '-') {
						$option_price -= $pod['price'];
					}
				}
			}
		}
		return  $option_price;
	}

	public function getOptionPoints($option_data, $product_base_price, $qty) {
		$option_points = 0;
		foreach ($option_data as $option_id => $option) {
			if($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image')
			{
				$pod = $this->getOptionValueDiscount($option['product_option_value_id'], $product_base_price, $qty);
				if($pod['points_prefix'] == '+') {
					$option_points += $pod['points'];
				} elseif($pod['points_prefix'] == '-') {
					$option_points -= $pod['points'];
				}
			}
		}
		return $option_points;
	}

	private function getOptionValueDiscount($product_option_value_id, $product_base_price, $qty) {
		$pov_query = $this->db->query("SELECT pov.*,pods.* FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "myoc_pod_setting pods ON (pov.product_option_id = pods.product_option_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "'");
		
		$option_value = array(
			'price'			=> $pov_query->row['price'],
			'price_prefix'	=> $pov_query->row['price_prefix'],
			'special'		=> false,
			'special_prefix'=> false,
			'points'		=> $pov_query->row['points'],
			'points_prefix'	=> $pov_query->row['points_prefix'],
			'qty_cart'		=> $pov_query->row['qty_cart'],
		);

		$pods = $this->getPod($pov_query->row['product_option_id']);

		if($pods && isset($pods['pods'][$product_option_value_id])) {
			rsort($pods['quantities']);
			foreach ($pods['quantities'] as $quantity) {
				if($quantity <= $qty && isset($pods['pods'][$product_option_value_id][$quantity])) {
					$pod = $pods['pods'][$product_option_value_id][$quantity];

					$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$pov_query->row['product_id'] . "' AND p.date_available <= NOW() AND p.status = '1'");

					$product_base_points = $product_query->row['points'];

					if($pod['option_base_price']) {
						$option_base_price = $option_value['price'];
						if($option_value['price_prefix'] == '-') {
							$option_base_price *= -1;
						}
					} else {
						$option_base_price = 0;
					}

					if($pod['option_base_points']) {
						$option_base_points = $option_value['points'];
						if($option_value['points_prefix'] == '-') {
							$option_base_points *= -1;
						}
					} else {
						$option_base_points = 0;
					}

					switch ($pod['price_prefix']) {
						case '+':
							$pod['price'] = $option_base_price + $pod['price'];
							break;
						case '-':
							$pod['price'] = $option_base_price - $pod['price'];
							break;
						case '=':
							if($pods['flat_rate']) {
								$pod['price'] -= ($product_base_price * $qty);
							} else {
								$pod['price'] -= $product_base_price;
							}
							break;
						case '+%':
							if($option_base_price) 
							{
								$pod['price'] = $option_base_price + ($option_base_price * $pod['price']/100);
							} else {
								$pod['price'] = ($product_base_price * $pod['price']/100);
							}
							break;
						case '-%':
							if($option_base_price) 
							{
								$pod['price'] = $option_base_price - ($option_base_price * $pod['price']/100);
							} else {
								$pod['price'] = ($product_base_price * -$pod['price']/100);
							}
							break;
						default:
							$pod['price'] = $option_base_price + $pod['price'];
							break;
					}

					switch ($pod['special_prefix']) {
						case '+':
							$pod['special'] = $option_base_price + $pod['special'];
							break;
						case '-':
							if((float)$pod['special'] == 0) {
								$pod['special'] = false;
							} else {
								$pod['special'] = $option_base_price - $pod['special'];
							}
							break;
						case '=':
							if($pods['flat_rate']) {
								$pod['special'] -= ($product_base_price * $qty);
							} else {
								$pod['special'] -= $product_base_price;
							}
							break;
						case '+%':
							if($option_base_price) 
							{
								$pod['special'] = $option_base_price + ($option_base_price * $pod['special']/100);
							} else {
								$pod['special'] = ($product_base_price * $pod['special']/100);
							}
							break;
						case '-%':
							if($option_base_price) 
							{
								$pod['special'] = $option_base_price - ($option_base_price * $pod['special']/100);
							} else {
								$pod['special'] = ($product_base_price * -$pod['special']/100);
							}
							break;
						default:
							$pod['special'] = $option_base_price + $pod['special'];
							break;
					}

					switch ($pod['points_prefix']) {
						case '+':
							$pod['points'] = $option_base_points + $pod['points'];
							break;
						case '-':
							$pod['points'] = $option_base_points - $pod['points'];
							break;
						case '=':
							if($pods['flat_rate']) {
								$pod['points'] -= ($product_base_points * $qty);
							} else {
								$pod['points'] -= $product_base_points;
							}
							break;
						case '+%':
							if($option_base_points) 
							{
								$pod['points'] = $option_base_points + ($option_base_points * $pod['points']/100);
							} else {
								$pod['points'] = ($product_base_points * $pod['points']/100);
							}
							break;
						case '-%':
							if($option_base_points) 
							{
								$pod['points'] = $option_base_points - ($option_base_points * $pod['points']/100);
							} else {
								$pod['points'] = ($product_base_points * -$pod['points']/100);
							}
							break;
						default:
							$pod['points'] = $option_base_points + $pod['points'];
							break;
					}

					if($pods['flat_rate']) {
						$pod['price'] /= $qty;
						$pod['special'] = $pod['special'] === false ? false : $pod['special'] / $qty;
						$pod['points'] /= $qty;
					}

					$option_value['price_prefix'] = (float)$pod['price'] < 0 ? '-' : '+';
					$option_value['price'] = abs($pod['price']);
					if($pod['special'] !== false && ($pod['date_start'] == '0000-00-00' || $pod['date_start'] < date('Y-m-d')) && ($pod['date_end'] == '0000-00-00' || $pod['date_end'] > date('Y-m-d'))) {
						$option_value['special_prefix'] = (float)$pod['special'] < 0 ? '-' : '+';
						$option_value['special'] = abs($pod['special']);
					}
					$option_value['points_prefix'] = (float)$pod['points'] < 0 ? '-' : '+';
					$option_value['points'] = abs($pod['points']);
					
					return $option_value;
				}
			}
		}			
		if($pov_query->row['flat_rate']) {
			$option_value['price'] /= $qty;
			$option_value['points'] /= $qty;
		}
		return $option_value;
	}
}
?>