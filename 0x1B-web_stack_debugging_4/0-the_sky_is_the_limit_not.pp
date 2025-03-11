class optimize_nginx {
    file { '/etc/nginx/nginx.conf':
        ensure  => file,
        content => template('optimize_nginx/optimized_nginx.conf'),
        notify  => Service['nginx'],
    }

    service { 'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        subscribe  => File['/etc/nginx/nginx.conf'],
    }
}

# Include the class properly
include optimize_nginx

