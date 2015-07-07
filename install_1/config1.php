<?php
/**
 * USER INSTRUCTION:
 *
 * 1. upload install.php to your opencart folder (/public_html)
 * 2. configure install.php at CONFIGURE HERE section
 * 3. run install.php from your web browser: http://www.yourdomain.com/install.php
 * 4. delete install.php.
 */

################################################################################
### CONFIGURE HERE
################################################################################



define('HTTP_SERVER', 'http://magazines-india.com/admin/');
define('HTTP_CATALOG', 'http://magazines-india.com/');

// HTTPS
define('HTTPS_SERVER', 'https://magazines-india.com/admin/');
define('HTTPS_CATALOG', 'https://magazines-india.com/');

// DIR
define('DIR_APPLICATION', $_SERVER['DOCUMENT_ROOT'].'/admin/');
define('DIR_SYSTEM', $_SERVER['DOCUMENT_ROOT'].'/system/');
define('DIR_DATABASE', $_SERVER['DOCUMENT_ROOT'].'/system/database/');
define('DIR_LANGUAGE', $_SERVER['DOCUMENT_ROOT'].'/admin/language/');
define('DIR_TEMPLATE',$_SERVER['DOCUMENT_ROOT'].'/admin/view/template/');
define('DIR_CONFIG', $_SERVER['DOCUMENT_ROOT'].'/system/config/');
define('DIR_IMAGE', $_SERVER['DOCUMENT_ROOT'].'/image/');
define('DIR_CACHE', $_SERVER['DOCUMENT_ROOT'].'/system/cache/');
define('DIR_DOWNLOAD',$_SERVER['DOCUMENT_ROOT'].'/download/');
define('DIR_LOGS', $_SERVER['DOCUMENT_ROOT'].'/system/logs/');
define('DIR_CATALOG', $_SERVER['DOCUMENT_ROOT'].'/catalog/');
define('DIR_FEDEX', $_SERVER['DOCUMENT_ROOT'].'/fedexWSDL/');


define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'indiazin_magazin');
define('DB_PASSWORD', 'admin@123');
define('DB_DATABASE', 'indiazin_magazinesindia');
define('DB_PREFIX', 'oc_');


?>