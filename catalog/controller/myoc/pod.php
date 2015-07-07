<?php  
class ControllerMyocPod extends Controller {
	public function index($args) {
		$this->language->load('myoc/pod');

		$this->data['text_col_quantity'] = $this->language->get('text_col_quantity');
		$this->data['text_col_stock'] = $this->language->get('text_col_stock');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_unit'] = $this->language->get('text_unit');
		$this->data['text_total'] = $this->language->get('text_total');
		$this->data['text_price'] = $this->language->get('text_price');
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['error_quantity'] = $this->language->get('error_quantity');

		$pods = $this->myocpod->getPod($args['product_option_id']);

		$this->data['option'] = array();

		if($pods) {
			$quantities = $pods['quantities'];
			sort($quantities);

			$this->load->model('catalog/product');

			$product_info = $this->model_catalog_product->getProduct($pods['product_id']);
			$product_discounts = $this->model_catalog_product->getProductDiscounts($pods['product_id']);
			$product_options = $this->model_catalog_product->getProductOptions($pods['product_id']);

			foreach ($product_options as $product_option) {
				if($product_option['product_option_id'] == $args['product_option_id'] && is_array($product_option['option_value'])) {
					$option_discount_data =
					$product_option_value_data = array();
					$ranges = array();

					foreach ($product_option['option_value'] as $option_value) {
						$prev_pod = $option_value;
						$prev_pod['option_base_price'] = 0;
						$prev_pod['special'] = 0;
						$prev_pod['special_prefix'] = '-';

						foreach ($quantities as $quantity) {
							foreach ($pods['pods'] as $pod) {
								if(isset($pod[$quantity]) && $pod[$quantity]['product_option_value_id'] == $option_value['product_option_value_id']) {
									$pod = $pod[$quantity];
									$prev_pod = $pod;
								} else {
									$pod = $prev_pod;
								}
								$pod['quantity'] = $quantity;

								if($product_info['special']) {
									$product_base_price = $product_info['special'];
								} else {
									$product_base_price = $product_info['price'];
									if($product_discounts) {
										foreach ($product_discounts as $product_discount) {
											if($quantity >= $product_discount['quantity']) {
												$product_base_price = $product_discount['price'];
											} else {
												break;
											}
										}
									}
								}

								if($pod['option_base_price']) {
									$option_base_price = $option_value['price'];
									if($option_value['price_prefix'] == '-') {
										$option_base_price *= -1;
									}
								} else {
									$option_base_price = 0;
								}

								if($pods['flat_rate']) {
									$option_discount_price = $pod['price'] / $quantity;
									$option_discount_special = $pod['special'] / $quantity;
									$product_total_price = $product_base_price + ($option_base_price / $quantity);
								} else {
									$option_discount_price = $pod['price'];
									$option_discount_special = $pod['special'];
									$product_total_price = $product_base_price + $option_base_price;
								}


								$price_suffix =
								$special_suffix = '';

								switch ($pod['price_prefix']) {
									case '+':
										$final_price = $product_total_price + $option_discount_price;
										$price_prefix = '+';
										break;
									case '-':
										$final_price = $product_total_price - $option_discount_price;
										$price_prefix = '-';
										break;
									case '=':
										$final_price = $option_discount_price;
										$price_prefix = '';
										break;
									case '+%':
										if($option_base_price) 
										{
											$final_price = $product_total_price + ($option_base_price * $option_discount_price/100);
										} else {
											$final_price = $product_total_price + ($product_base_price * $option_discount_price/100);
										}
										$price_prefix = '+';
										$price_suffix = '%';
										break;
									case '-%':
										if($option_base_price) 
										{
											$final_price = $option_base_price - ($option_base_price * $option_discount_price/100);
										} else {
											$final_price = $option_base_price - ($product_base_price * $option_discount_price/100);
										}
										$price_prefix = '-';
										$price_suffix = '%';
										break;
									default:
										$final_price = $product_total_price + $option_discount_price;
										$price_prefix = '+';
										break;
								}

								switch ($pod['special_prefix']) {
									case '+':
										$final_special = $product_total_price + $option_discount_special;
										$special_prefix = '+';
										break;
									case '-':
										$final_special = $product_total_price - $option_discount_special;
										if($option_discount_special == 0) {
											$special_prefix = false;
										} else {
											$special_prefix = '-';
										}
										break;
									case '=':
										$final_special = $option_discount_special;
										$special_prefix = '';
										break;
									case '+%':
										if($option_base_price) 
										{
											$final_special = $product_total_price + ($option_base_price * $option_discount_special/100);
										} else {
											$final_special = $product_total_price + ($product_base_price * $option_discount_special/100);
										}
										$special_prefix = '+';
										$special_suffix = '%';
										break;
									case '-%':
										if($option_base_price) 
										{
											if($option_value['price_prefix'] == '=') {
											
											$final_special = $option_base_price - ($option_base_price * $option_discount_special/100);
											}
											else
											{
											 $final_special = $product_total_price - ($option_base_price * $option_discount_special/100);
											}
										} else {
											if($option_value['price_prefix'] == '=') {
											
											$final_special = $option_base_price - ($option_base_price * $option_discount_special/100);
											}
											else
											{
												
											 $final_special = $product_total_price - ($option_base_price * $option_discount_special/100);
											}
										}
										$special_prefix = '-';
										$special_suffix = '%';
										break;
									default:
									     
										 if($option_value['price_prefix'] == '=') {
											
											$final_special =  $option_discount_special;
											}
											else
											{
											$final_special = $product_total_price + $option_discount_special;
											}
										
										$special_prefix = '+';
										break;
								}

								if($pods['show_final']) {
									$raw_price = $final_price;
									$price_prefix =
									$price_suffix = '';

									$raw_special = $final_special;
									$special_prefix = $special_prefix === false ? false : '';
									$special_suffix = $special_prefix === false ? false : '';
								} else {
									$raw_price = $option_discount_price;
									$raw_special = $option_discount_special;
								}

								if($price_suffix == '%') {
									$price = number_format((float)$raw_price, 2);
									$price_total = number_format((float)$raw_price * $quantity, 2);
								} elseif((float)$raw_price) {
									$price = $this->currency->format($this->tax->calculate($raw_price, $product_info['tax_class_id'], $this->config->get('config_tax')));
									if($pods['show_final']) {
										$price_total = $this->currency->format($this->tax->calculate($raw_price, $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity);
									} else {
										$price_total = $this->currency->format($this->tax->calculate($raw_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
									}
								} else {
									$tax_price = $this->tax->calculate($raw_price, $product_info['tax_class_id'], $this->config->get('config_tax'));
									if($tax_price != 0 && $price_prefix == '-') {
										$price_prefix = '+';
									}
									$price = $this->currency->format($tax_price);
									$price_total = $this->currency->format($tax_price * $quantity);
								}

								if($special_prefix === false || ($pod['date_start'] != '0000-00-00' && $pod['date_start'] > date('Y-m-d')) || ($pod['date_end'] != '0000-00-00' && $pod['date_end'] < date('Y-m-d'))) {
									$special = false;
									$special_total = false;
								} elseif($special_suffix == '%') {
									$special = number_format((float)$raw_special, 2);
									$special_total = number_format((float)$raw_special * $quantity, 2);
								} elseif((float)$raw_special) {
									$special = $this->currency->format($this->tax->calculate($raw_special, $product_info['tax_class_id'], $this->config->get('config_tax')));
									if($pods['show_final']) {
										$special_total = $this->currency->format($this->tax->calculate($raw_special, $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity);
									} else {
										$special_total = $this->currency->format($this->tax->calculate($raw_special * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
									}
								} else {
									$tax_special = $this->tax->calculate($raw_special, $product_info['tax_class_id'], $this->config->get('config_tax'));
									if($tax_special != 0 && $special_prefix == '-') {
										$special_prefix = '+';
									}
									$special = $this->currency->format($tax_special);
									$special_total = $this->currency->format($tax_special * $quantity);
								}

								$option_discount_data[$pod['quantity']] = array(
									'price'			=> $price_prefix . $price . $price_suffix,
									'price_total'	=> $price_prefix . $price_total . $price_suffix,
									'special'		=> $special === false ? false : $special_prefix . $special . $special_suffix,
									'specialdata'   => intval($option_discount_special),
									'special_total'	=> $special_total === false ? false : $special_prefix . $special_total . $special_suffix,
								);
							}
							if(end($quantities) == $quantity) {
								$ranges[$quantity] = $quantity . $this->language->get('text_plus');
							} else {
								$u = 0;
								do {
									$u++;
									$upper_quantity = $quantities[$u]-1;
								} while($quantities[$u] <= $quantity);
								$ranges[$quantity] = $quantity . $this->language->get('text_range') . $upper_quantity;
							}
						}

						if($pods['show_final']) {
							if($option_value['price_prefix'] == '+') {
								$option_value_price = ($product_info['special'] ? $product_info['special'] : $product_info['price']) + $option_value['price'];
							} else {								
								$option_value_price = ($product_info['special'] ? $product_info['special'] : $product_info['price']) - $option_value['price'];
							}
							$option_value['price_prefix'] = '';
						} else {
							$option_value_price = $option_value['price'];
						}

						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$option_price = $this->currency->format($this->tax->calculate($option_value_price, $product_info['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$option_price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id'	=> $option_value['product_option_value_id'],
							'option_value_id'			=> $option_value['option_value_id'],
							'name'						=> $option_value['name'],
							'image'						=> isset($option_value['image']) ? $this->model_tool_image->resize($option_value['image'], 50, 50) : false,
							'price'						=> $option_price,
							'stock'						=> $option_value['quantity'],
							'totalissues'				=> $option_value['totalissues'],
							'subtract'					=> $option_value['subtract'],
							'price_prefix'				=> $option_value['price_prefix'],
							'option_discount'			=> $option_discount_data,
						);
					}
					$this->data['option'] = array(
						'product_option_id'	=> $product_option['product_option_id'],
						'option_id'			=> $product_option['option_id'],
						'name'				=> $product_option['name'],
						'type'				=> $product_option['type'],
						'required'			=> $product_option['required'],
						'table_style'		=> $pods['table_style'],
						'price_format'		=> $pods['price_format'],
						'qty_column'		=> $pods['qty_column'],
						'qty_format'		=> $pods['qty_format'],
						'stock_column'		=> $pods['stock_column'],
						'qty_cart'			=> $pods['qty_cart'],
						'quantities'		=> $ranges,
						'option_value'		=> $product_option_value_data,
					);

					break;
				}
			}
			$this->data['minimum'] = $product_info['minimum'];
			$this->data['product_id'] = $product_info['product_id'];

		    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/myoc/pod.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/myoc/pod.tpl';
			} else {
				$this->template = 'default/template/myoc/pod.tpl';
			}
			$this->render();			
		}
	}
}
?>