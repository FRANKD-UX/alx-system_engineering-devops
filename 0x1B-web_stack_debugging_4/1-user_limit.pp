# This Puppet manifest adjusts the file descriptor limits for the holberton user.

file { '/etc/security/limits.conf':
  ensure  => file,
  content => template('mymodule/limits.conf.erb'),
}

# Ensure that the necessary limits are in place
file_line { 'holberton_soft_nofile':
  path => '/etc/security/limits.conf',
  line => 'holberton    soft    nofile    4096',
}

file_line { 'holberton_hard_nofile':
  path => '/etc/security/limits.conf',
  line => 'holberton    hard    nofile    8192',
}

exec { 'reload_limits':
  command => '/sbin/sysctl -p',
  refreshonly => true,
  subscribe => File['/etc/security/limits.conf'],
}

