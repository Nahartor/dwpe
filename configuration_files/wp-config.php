<?php
define( 'DB_NAME', 'wordpress' ); //(3)
define( 'DB_USER', 'wordpress' ); //(1)
define( 'DB_PASSWORD', 'wordpress' ); //(2)
define( 'DB_HOST', 'db' ); //(4)
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
