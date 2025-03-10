# This Puppet manifest fixes the WordPress LAMP stack by updating the DB host in wp-config.php
# It replaces 'localhost' with '127.0.0.1' to avoid Unix socket errors and restarts Apache.

$sed_command = "/bin/sed -i 's/define(\\'DB_HOST\\', \\'localhost\\');/define(\\'DB_HOST\\', \\'127.0.0.1\\');/' /var/www/html/wp-config.php"

exec { 'fix-wp-config-db-host':
  command => "${sed_command} && service apache2 restart",
  unless  => "/bin/grep -q \"define('DB_HOST', '127.0.0.1');\" /var/www/html/wp-config.php",
  path    => ['/bin', '/usr/bin'],
  require => File['/var/www/html/wp-config.php'],
}

file { '/var/www/html/wp-config.php':
  ensure  => 'file',
  require => Package['apache2'],
}

