# This Puppet manifest optimizes Nginx for high concurrent traffic

class optimize_nginx {
    file { '/etc/nginx/nginx.conf':
        ensure  => file,
        content => template('nginx/optimized_nginx.conf'),
        notify  => Service['nginx'],
    }

    service { 'nginx':
        ensure => running,
        enable => true,
    }

    exec { 'reload-nginx':
        command     => '/etc/init.d/nginx reload',
        refreshonly => true,
        subscribe   => File['/etc/nginx/nginx.conf'],
    }
}

include optimize_nginx

