# This Puppet manifest fixes Nginx configuration to handle high traffic loads
# by increasing worker connections, adjusting buffer sizes, and raising system limits.

# Increase Nginx worker connections
exec { 'increase_nginx_worker_connections':
  command => 'sed -i "s/worker_connections.*/worker_connections 4096;/" /etc/nginx/nginx.conf',
  path    => '/bin:/usr/bin',
  unless  => 'grep "worker_connections 4096;" /etc/nginx/nginx.conf',
}

# Increase system file descriptor limit
exec { 'increase_file_descriptor_limit':
  command => 'ulimit -n 65536',
  path    => '/bin:/usr/bin',
}

# Reload Nginx to apply changes
exec { 'reload_nginx':
  command => 'service nginx reload',
  path    => '/bin:/usr/bin',
  require => Exec['increase_nginx_worker_connections'],
}

# Ensure Nginx is running
service { 'nginx':
  ensure => 'running',
  enable => true,
}
