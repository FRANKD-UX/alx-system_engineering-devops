# Fixes Nginx configuration to handle high traffic by increasing worker connections and file descriptors
exec { 'fix--for-nginx':
  command => '/bin/sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/g; s/# ULIMIT=/ULIMIT=/g; s/ULIMIT=.*/ULIMIT=\"-n 8192\"/g" /etc/nginx/nginx.conf /etc/default/nginx && sudo service nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'test -f /etc/nginx/nginx.conf',
}# Fixes Nginx configuration to handle high traffic by increasing worker connections and file descriptors
exec { 'fix--for-nginx':
  command => '/bin/sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/g; s/# ULIMIT=/ULIMIT=/g; s/ULIMIT=.*/ULIMIT=\"-n 8192\"/g" /etc/nginx/nginx.conf /etc/default/nginx && sudo service nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'test -f /etc/nginx/nginx.conf',
}
