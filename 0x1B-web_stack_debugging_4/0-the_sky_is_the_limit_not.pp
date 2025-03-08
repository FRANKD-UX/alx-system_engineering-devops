# Fixes Nginx configuration to handle high traffic by increasing worker connections and file descriptors

exec { 'increase_worker_connections':
  command => '/bin/sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/g" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'test -f /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

exec { 'increase_ulimit':
  command => '/bin/sed -i "s/^# ULIMIT=.*$/ULIMIT=\"-n 65535\"/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'test -f /etc/default/nginx',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

