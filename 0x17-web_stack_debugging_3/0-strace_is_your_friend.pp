# 0-strace_is_your_friend.pp
# This Puppet manifest fixes the WordPress web stack by updating the DB host in
# wp-config.php from 'localhost' (which uses the Unix socket and causes a permission denied error)
# to '127.0.0.1' (forcing a TCP connection). It then restarts Apache.
#
# Requirements:
#   - WordPress is installed in /var/www/html
#   - Puppet manifest passes puppet-lint version 2.1.1
#   - Apache runs on Ubuntu 14.04 LTS (checked with Puppet v3.4)

file_line { 'fix-wp-config-db-host':
  path  => '/var/www/html/wp-config.php',
  match => '^define\(\'DB_HOST\',',
  line  => 'define(\'DB_HOST\', \'127.0.0.1\');',
  notify => Service['apache2'],
}

service { 'apache2':
  ensure => running,
  enable => true,
}

