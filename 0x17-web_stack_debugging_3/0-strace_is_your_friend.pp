class wordpress_fix {
    package { 'sed':
        ensure => installed,
    }

    file_line { 'fix-wp-db-host':
        path   => '/var/www/html/wp-config.php',
        line   => "define('DB_HOST', '127.0.0.1');",
        match  => "define('DB_HOST', 'localhost');",
        require => Package['sed'],
        notify => Service['apache2'],
    }

    service { 'apache2':
        ensure    => running,
        enable    => true,
        hasstatus => true,
        hasrestart => true,
    }
}

include wordpress_fix

