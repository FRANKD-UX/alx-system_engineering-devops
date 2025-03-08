nx configuration to handle 2000 requests with 100 concurrent connections

exec { 'increase_worker_connections':
  command => '/bin/sed -i "s/worker_connections .*/worker_connections 19000;/" /etc/nginx/nginx.conf',
  onlyif  => '/bin/grep -q "worker_connections  768;" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

exec { 'increase_ulimit':
  command => '/bin/sed -i "s/^ULIMIT=.*/ULIMIT=\"-n 32768\"/" /etc/default/nginx',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

