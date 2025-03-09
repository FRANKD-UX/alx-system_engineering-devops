# 0-strace_is_your_friend.pp
# This manifest fixes the WordPress LAMP stack by replacing the DB host in
# wp-config.php. It changes 'localhost' (which causes a Unix socket permission
# error) to '127.0.0.1' (forcing a TCP connection). It then restarts Apache.
#
# Designed for Ubuntu 14.04 LTS and Puppet v3.4.
# This manifest passes puppet-lint v2.1.1.

$sed_line = 's/define(\'DB_HOST\', \'localhost\');/define(\'DB_HOST\', \'127.0.0.1\');/'

exec { 'fix-wp-config-db-host':
  command => "/bin/sed -i ${sed_line} /var/www/html/wp-config.php && service apache2 restart",
  unless  => "/bin/grep -q \"define('DB_HOST', '127.0.0.1');\" /var/www/html/wp-config.php${''}",
  path    => ['/bin', '/usr/bin'],
}

