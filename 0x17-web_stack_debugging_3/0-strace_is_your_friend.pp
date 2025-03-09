# 0-strace_is_your_friend.pp
# This Puppet manifest fixes the WordPress 500 Internal Server Error by changing 
# the database host from 'localhost' (which uses a Unix socket with permission issues) 
# to '127.0.0.1' (which forces a TCP connection).
#
# It uses an Exec resource to update the wp-config.php file and then restarts Apache.
#
# Requirements:
#   - WordPress is installed in /var/www/html/.
#   - Puppet 3.4 is available.
#   - The manifest passes puppet-lint version 2.1.1.

exec { 'fix-wordpress-db-host':
  command => '/bin/sed -i "s/define(\'DB_HOST\', \'localhost\');/define(\'DB_HOST\', \'127.0.0.1\');/" /var/www/html/wp-config.php && service apache2 restart',
  path    => ["/bin", "/usr/bin"],
  unless  => '/bin/grep "define(\'DB_HOST\', \'127.0.0.1\');" /var/www/html/wp-config.php',
}

