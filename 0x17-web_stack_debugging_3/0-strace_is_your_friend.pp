exec { 'fix-wp-config-db-host':
  command => "/bin/sed -i \"s/define(\\'DB_HOST\\', \\'localhost\\');/define(\\'DB_HOST\\', \\'127.0.0.1\\');/\" /var/www/html/wp-config.php && service apache2 restart",
  unless  => "[ -f /var/www/html/wp-config.php ] && /bin/grep -q \"define('DB_HOST', '127.0.0.1');\" /var/www/html/wp-config.php",
  path    => ['/bin', '/usr/bin'],
}

