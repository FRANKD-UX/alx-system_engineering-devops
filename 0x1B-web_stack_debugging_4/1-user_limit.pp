# Reconfigure the OS for 'holberton' to login and open a file without any error message

# Increase hard file limit for the holberton user
exec { 'increase-hard-file-limit-holberton-user':
  command => 'sed -i "/holberton hard nofile/s/[0-9]\+/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin']
}

# Increase soft file limit for the holberton user
exec { 'increase-soft-file-limit-holberton-user':
  command => 'sed -i "/holberton soft nofile/s/[0-9]\+/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin']
}

