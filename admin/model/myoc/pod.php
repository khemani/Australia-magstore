<?php
class ModelMyocPod extends Model {
	public function installTable()
	{
		$this->upgradeTable();
  		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "myoc_pod` (
			`pod_id` int(11) NOT NULL AUTO_INCREMENT,
			`product_option_value_id` int(11) NOT NULL,
			`customer_group_id` int(11) NOT NULL,
			`quantity` int(11) NOT NULL,
			`option_base_price` tinyint(1) NOT NULL DEFAULT '0',
			`price` decimal(15,4) NOT NULL DEFAULT '0.0000',
			`price_prefix` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+',
			`special` decimal(15,4) NOT NULL DEFAULT '0.0000',
			`special_prefix` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
			`option_base_points` tinyint(1) NOT NULL DEFAULT '0',
			`points` int(8) NOT NULL DEFAULT '0',
			`points_prefix` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+',
			`priority` int(5) NOT NULL DEFAULT '1',
			`date_start` date NOT NULL DEFAULT '0000-00-00',
			`date_end` date NOT NULL DEFAULT '0000-00-00',
			PRIMARY KEY (`pod_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;");
  		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "myoc_pod_setting` (
			`product_option_id` int(11) NOT NULL,
			`show_price_product` tinyint(1) NOT NULL,
			`show_price_cart` tinyint(1) NOT NULL,
			`show_final` tinyint(1) NOT NULL,
			`flat_rate` tinyint(1) NOT NULL,
			`table_style` enum('h','v') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h',
			`price_format` enum('unit','total','both') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'total',
			`qty_column` tinyint(1) NOT NULL DEFAULT '1',
			`qty_format` enum('single','range') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single',
			`stock_column` tinyint(1) NOT NULL DEFAULT '0',
			`qty_cart` tinyint(1) NOT NULL DEFAULT '0',
			PRIMARY KEY (`product_option_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;");
  		$this->db->query("INSERT IGNORE INTO `" . DB_PREFIX . "myoc_pod_setting` (
			`product_option_id`,
			`show_price_product`,
			`show_price_cart`,
			`show_final`,
			`flat_rate`,
			`table_style`,
			`price_format`,
			`qty_column`,
			`qty_format`,
			`stock_column`,
			`qty_cart`)
			SELECT `product_option_id`,1,1,0,0,'h','total','single',0,1,0 FROM `" . DB_PREFIX . "product_option`;");
	}

	public function uninstallTable()
	{
		$this->db->query("DROP TABLE IF EXISTS 
			`" . DB_PREFIX . "myoc_pod`,
			`" . DB_PREFIX . "myoc_pod_setting`;");
	}

	public function upgradeTable()
	{
		//from v1.2.1
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "product_option_value_discount'");
		if($query->num_rows)
		{
			$this->db->query("RENAME TABLE  `" . DB_PREFIX . "product_option_value_discount` TO  `" . DB_PREFIX . "myoc_product_option_value_discount` ;");
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "myoc_product_option` (
			  `product_option_id` int(11) NOT NULL,
			  `show_price` TINYINT( 1 ) NOT NULL,
			  `show_final` TINYINT( 1 ) NOT NULL,
			  `flat_rate` TINYINT( 1 ) NOT NULL,
			  PRIMARY KEY (`product_option_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;");
			$this->db->query("INSERT INTO " . DB_PREFIX . "myoc_product_option SELECT `product_option_id`,`show_price`,`show_final`,`flat_rate` FROM " . DB_PREFIX . "product_option");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "product_option` DROP `show_price`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "product_option` DROP `show_final`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "product_option` DROP `flat_rate`");
		}

		//from v1.3.1
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "myoc_product_option_value_discount'");
		if($query->num_rows)
		{
			$this->db->query("RENAME TABLE  `" . DB_PREFIX . "myoc_product_option_value_discount` TO  `" . DB_PREFIX . "myoc_pod` ;");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `product_option_value_discount_id` `pod_id` INT(11) NOT NULL AUTO_INCREMENT");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `quantity` `quantity` INT(11) NOT NULL");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `priority` `priority` INT(5) NOT NULL DEFAULT '1' AFTER `points_prefix`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` ADD `option_base_price` TINYINT(1) NOT NULL DEFAULT '0' AFTER `quantity`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `price_prefix` `price_prefix` VARCHAR(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+'");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` ADD `special` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price_prefix`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` ADD `special_prefix` VARCHAR(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-' AFTER `special`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` ADD `option_base_points` TINYINT(1) NOT NULL DEFAULT '0' AFTER `special_prefix`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `points` `points` INT(8) NOT NULL DEFAULT '0' AFTER `option_base_points`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod` CHANGE `points_prefix` `points_prefix` VARCHAR(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+'");

			$this->db->query("RENAME TABLE  `" . DB_PREFIX . "myoc_product_option` TO  `" . DB_PREFIX . "myoc_pod_setting` ;");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod_setting` CHANGE `show_price` `show_price_product` TINYINT( 1 ) NOT NULL");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod_setting` ADD `show_price_cart` TINYINT( 1 ) NOT NULL AFTER `show_price_product`");
			$this->db->query("ALTER TABLE  `" . DB_PREFIX . "myoc_pod_setting` ADD `table_style` ENUM('h','v') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h',
				ADD `price_format` ENUM('unit','total','both') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'total',
				ADD `qty_column` TINYINT( 1 ) NOT NULL DEFAULT '1',
				ADD `qty_cart` TINYINT( 1 ) NOT NULL DEFAULT '0'");
		}

		//from v1.4
		$status = true;
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "myoc_pod_setting'");
		if($query->num_rows)
		{
			$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "myoc_pod_setting`;");
			foreach ($query->rows as $column_data) {
				if($column_data['Field'] == 'qty_format')
				{
					$status = false;
					break;
				}
			}
			if($status) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "myoc_pod_setting` ADD `qty_format` enum('single','range') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single'");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "myoc_pod_setting` ADD `stock_column` tinyint(1) NOT NULL DEFAULT '0'");
			}
		}
	}
}
?>