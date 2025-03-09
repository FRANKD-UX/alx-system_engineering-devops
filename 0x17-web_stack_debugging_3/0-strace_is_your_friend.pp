# This manifest fixes the WordPress web stack by updating the DB host in 
# wp-config.php from 'localhost' (using the Unix socket with permission issues)
# to '127.0.0.1' (forcing a TCP connection). It then restarts Apache.
#
# Designed for Ubuntu 14.04 LTS and Puppet v3.4.
#
# The manifest passes puppet-lint v2.1.1.

file_line { 'wp-config_db_host':
  path   => '/var/www/html/wp-config.php',
  match  => '^define\\(\'DB_HOST\',',
  line   => 'define(\'DB_HOST\', \'127.0.0.1\');',
  notify => Service['apache2'],
}

service { 'apache2':
  ensure => running,
  enable => true,
}

