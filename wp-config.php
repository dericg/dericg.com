<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'dericg_com' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '8w#nC-!BD^ZCO>W5S9P=O_tLkU0<uDz{o>iWoI[Vur%o%+QbkpXPO25R`c_=kdR5' );
define( 'SECURE_AUTH_KEY',  '3<M+I#xl_rOhrA7[A4G0LuE5H;z(oFWlU.OO%%?|P81ExD[!GS^ktZjB/<_9WpZT' );
define( 'LOGGED_IN_KEY',    'Sty+*A`MX),u2~0C?L0FT6{[]yq=pf|Y[JnJ hb73>%~[}U5;r}.CmxLe[zf/+g3' );
define( 'NONCE_KEY',        '0 (@@8OOLNB8%Sw-h%O3T;G<}Yk/XTwA)<eJ9$$e6SSS`+-,dS-1vPHL~]_iU}>B' );
define( 'AUTH_SALT',        'pr)y( UNX+$F9^0^%T%9J`0-rNQURz^:Uwc%WK;`syq;$)[XaOV}{Gpr@6Bzi6hU' );
define( 'SECURE_AUTH_SALT', 'Lr2u_tuO{M$%fF]C7i;I;`SP3?IvMt|X]*6OSPjLD^gE7zSSP]Jh43<n?GLEIlC;' );
define( 'LOGGED_IN_SALT',   'pk<^TQ5au:oajkr?$g<enQhA3VN$qbY|nE#!MB#>M5Za[?A8;+D8P7uCJ2_l6zme' );
define( 'NONCE_SALT',       '$@v,?On;}}KJ`l$+=2U6$;lxajkm}#z3[]</tw(V7VHg{L!~7fl7u1$&k3o @Bzo' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_dericg';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
