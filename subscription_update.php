<?php

define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'indiazin_magazin');
define('DB_PASSWORD', 'admin@123');
define('DB_DATABASE', 'indiazin_magazinesindia');
define('DB_PREFIX', 'oc_');

$server = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$cnn = mysql_connect($server, $username, $password);
$cnn = mysql_select_db(DB_DATABASE, $cnn);

$sql = "SELECT * FROM `oc_product_option_value`";
$i = 1;
$abcd = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_array($abcd)) {
    $get = mysql_query("select * from `oc_myoc_pod_setting` where product_option_id = '" . $row['product_option_id'] . "'");
    if (mysql_num_rows($get) > 0) {
//        $actual_price_qry = mysql_query("SELECT price FROM `oc_product` where product_id = '" . $row['product_id'] . "'");
//        $actual_price = mysql_fetch_array($actual_price_qry);
//        $market_price = $row['price'];
//        $percent = round($actual_price) / round($market_price);
//        $discount = number_format($percent * 100, 2);
        $discount = '0';
        mysql_query("UPDATE `oc_myoc_pod` SET `price` = (SELECT price FROM `oc_product` where product_id = '" . $row['product_id'] . "') , special = '" . $discount . "'
            WHERE `product_option_id` = '" . $row['product_option_id'] . "';");
        mysql_query("UPDATE `oc_product_option_value` SET `totalissues` = (SELECT issues_per_year FROM `oc_product` where product_id = '" . $row['product_id'] . "') WHERE `product_option_id` = '" . $row['product_option_id'] . "';");
    } else {
//        $actual_price_qry = mysql_query("SELECT price FROM `oc_product` where product_id = '" . $row['product_id'] . "'");
//        $actual_price = mysql_fetch_array($actual_price_qry);
//        $market_price = $row['price'];
//        $percent = $actual_price / $market_price;
//        $discount = number_format($percent * 100, 2);
        $discount = '0';
        mysql_query("INSERT INTO `oc_myoc_pod_setting` (`product_option_id`, `show_price_product`, `show_price_cart`, `show_final`, `flat_rate`, `table_style`, `price_format`, `qty_column`, `qty_format`, `stock_column`, `qty_cart`) 
            VALUES ('" . $row['product_option_id'] . "', '1', '1', '1', '0', 'h', 'total', '0', 'single', '0', '1')");
        mysql_query("INSERT INTO `oc_myoc_pod` ( `product_option_value_id`, `customer_group_id`, `quantity`, `option_base_price`, `price`, `price_prefix`, `special`, `special_prefix`, `option_base_points`, `points`, `points_prefix`, `priority`, `date_start`, `date_end`) 
            VALUES ( '" . $row['product_option_value_id'] . "', '1', '100', '1', '5000', '=', '" . $discount . "', '-%', '0', '0', '+', '1', '0000-00-00', '0000-00-00');");
        mysql_query("UPDATE `oc_product_option_value` SET `totalissues` = (SELECT issues_per_year FROM `oc_product` where product_id = '" . $row['product_id'] . "') WHERE `product_option_id` = '" . $row['product_option_id'] . "';");
    }
}
?>
