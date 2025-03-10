$sed_line = "s/define('DB_HOST', 'localhost');/define('DB_HOST', '127.0.0.1');/"

exec { 'fix-wp-config-db-host':
  command => "/bin/sed -i \"s/define(\\'DB_HOST\\', \\'localhost\\');/define(\\'DB_HOST\\', \\'127.0.0.1\\');/\" /var/www/html/wp-config.php && service apache2 restart",
  unless  => "/bin/grep -q \"define('DB_HOST', '127.0.0.1');\" /var/www/html/wp-config.php",
  path    => ['/bin', '/usr/bin'],
}

