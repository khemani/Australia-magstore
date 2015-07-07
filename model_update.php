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
$sql = "SELECT * FROM `oc_product`";
$i = 1;
$abcd = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_array($abcd)) {
    mysql_query("UPDATE `oc_product` SET `model` = '" . $row['sku'] . "' WHERE `product_id` = '" . $row['product_id'] . "';");
}
?>
