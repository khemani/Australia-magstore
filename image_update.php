<?php

error_reporting(E_ALL);

define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'indiazin_magazin'); //
define('DB_PASSWORD', 'admin@123'); //
define('DB_DATABASE', 'indiazin_magazinesindia'); //
define('DB_PREFIX', 'oc_');

$server = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$cnn = mysql_connect($server, $username, $password) or die(mysql_error());
$cnn = mysql_select_db(DB_DATABASE, $cnn) or die(mysql_error());

$sql = "SELECT product_id,image FROM `oc_product` ORDER BY `oc_product`.`product_id` ASC";
$i = 1;
$abcd = mysql_query($sql) or die(mysql_error()); 
while ($row = mysql_fetch_array($abcd)) {
    $imagename = explode('.', $row['image']);
    // $imagename = str_replace('.abc','.jpg', $row['image']);



    $file_location = 'image/' . $imagename[0] . '.jpg';
    $file_name = $imagename[0] . '.jpg';
    $file_location1 = 'image/' . $imagename[0] . '.gif';
    $file_name1 = $imagename[0] . '.gif';
    $file_location2 = 'image/' . $imagename[0] . '.png';
    $file_name2 = $imagename[0] . '.png';
    $file_location3 = 'image/' . $imagename[0] . '.bmp';
    $file_name3 = $imagename[0] . '.bmp';
    $file_location4 = 'image/' . $imagename[0] . '.jpeg';
    $file_name4 = $imagename[0] . '.jpeg';
    $file_location5 = 'image/' . $imagename[0] . '.JPG';
    $file_name5 = $imagename[0] . '.JPG';
    $file_location6 = 'image/' . $imagename[0] . '.GIF';
    $file_name6 = $imagename[0] . '.GIF';
    $file_location7 = 'image/' . $imagename[0] . '.PNG';
    $file_name7 = $imagename[0] . '.PNG';
    $file_location8 = 'image/' . $imagename[0] . '.BMP';
    $file_name8 = $imagename[0] . '.BMP';
    $file_location9 = 'image/' . $imagename[0] . '.JPEG';
    $file_name9 = $imagename[0] . '.JPEG';
    if (file_exists($file_location)) {
       // echo $row['image'] . '*' . $file_location . '</br>';
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
    } else if (file_exists($file_location1)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name1 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
       // echo $row['image'] . '*' . $file_location1 . '</br>';
    } else if (file_exists($file_location2)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name2 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location2 . '</br>';
    } else if (file_exists($file_location3)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name3 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location3 . '</br>';
    } else if (file_exists($file_location4)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name4 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location4 . '</br>';
    } else if (file_exists($file_location5)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name5 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
       // echo $row['image'] . '*' . $file_location1 . '</br>';
    } else if (file_exists($file_location6)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name6 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location2 . '</br>';
    } else if (file_exists($file_location7)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name7 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location3 . '</br>';
    } else if (file_exists($file_location8)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name8 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location4 . '</br>';
    } else if (file_exists($file_location9)) {
        $sql = "UPDATE `oc_product` SET `image` = '" . $file_name9 . "' WHERE `oc_product`.`product_id` = '" . $row['product_id'] . "'"; //[0] . 'jpg'
        mysql_query($sql) or die(mysql_error());
      //  echo $row['image'] . '*' . $file_location4 . '</br>';
    }else{
         echo $row['image'] . ' * No image</br>';
    }
    
}
?>
