# This Puppet manifest updates WordPress DB host and restarts Apache to ensure proper connectivity.

class web_stack_fix {
  
  # Define the sed command to replace 'localhost' with '127.0.0.1' in wp-config.php
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
}

include web_stack_fix

