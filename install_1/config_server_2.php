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



// HTTP
define('HTTP_SERVER', 'http://magazines-australia.com/admin/');
define('HTTP_CATALOG', 'http://magazines-australia.com/');

// HTTPS
define('HTTPS_SERVER', 'http://magazines-australia.com/admin/');
define('HTTPS_CATALOG', 'http://magazines-australia.com/');

// DIR
define('DIR_APPLICATION', 'G:/PleskVhosts/magazines-australia.com/httpdocs/admin/');
define('DIR_SYSTEM', 'G:/PleskVhosts/magazines-australia.com/httpdocs/system/');
define('DIR_DATABASE', 'G:/PleskVhosts/magazines-australia.com/httpdocs/system/database/');
define('DIR_LANGUAGE', 'G:/PleskVhosts/magazines-australia.com/httpdocs/admin/language/');
define('DIR_TEMPLATE','G:/PleskVhosts/magazines-australia.com/httpdocs/admin/view/template/');
define('DIR_CONFIG', 'G:/PleskVhosts/magazines-australia.com/httpdocs/system/config/');
define('DIR_IMAGE', 'G:/PleskVhosts/magazines-australia.com/httpdocs/image/');
define('DIR_CACHE', 'G:/PleskVhosts/magazines-australia.com/httpdocs/system/cache/');
define('DIR_DOWNLOAD','G:/PleskVhosts/magazines-australia.com/httpdocs/system/download/');
define('DIR_LOGS', 'G:/PleskVhosts/magazines-australia.com/httpdocs/system/logs/');
define('DIR_CATALOG', 'G:/PleskVhosts/magazines-australia.com/httpdocs/catalog/');
define('DIR_FEDEX', 'G:/PleskVhosts/magazines-australia.com/httpdocs/fedexWSDL/');


define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '198.71.225.65');
define('DB_USERNAME', 'MagAustralia');
define('DB_PASSWORD', 'Yspg8$32');
define('DB_DATABASE', 'MagAustralia_1');
define('DB_PREFIX', 'oc_');


?>