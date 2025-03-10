# This Puppet manifest fixes the WordPress LAMP stack by updating the DB host in
# wp-config.php from 'localhost' to '127.0.0.1' (forcing a TCP connection) and then
# restarting Apache.

$sed_line = "s/define('DB_HOST', 'localhost');/define('DB_HOST', '127.0.0.1');/"

exec { 'fix-wp-config-db-host':
  command => '/bin/sed -i ' + $sed_line +
    ' /var/www/html/wp-config.php && service apache2 restart',
  unless  => '/bin/grep -q "define(\'DB_HOST\', \'127.0.0.1\');" ' +
    '/var/www/html/wp-config.php',
  path    => ['/bin', '/usr/bin'],
}

