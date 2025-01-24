class custom_http_header {
    file { '/etc/nginx/conf.d/custom_header.conf':
        ensure  => 'file',
        content => "add_header X-Served-By \$hostname;",
        notify  => Service['nginx'],
    }

    service { 'nginx':
        ensure => 'running',
        enable => true,
    }
}

include custom_http_header

