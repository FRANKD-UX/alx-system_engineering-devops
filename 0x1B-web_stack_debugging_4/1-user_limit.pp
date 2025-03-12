class user_limit {

  # Ensure the correct limits exist for the holberton user
  exec { 'increase-hard-file-limit-holberton-user':
    command => 'sed -i "/holberton hard nofile/c\holberton hard nofile 50000" /etc/security/limits.conf || echo "holberton hard nofile 50000" >> /etc/security/limits.conf',
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  exec { 'increase-soft-file-limit-holberton-user':
    command => 'sed -i "/holberton soft nofile/c\holberton soft nofile 50000" /etc/security/limits.conf || echo "holberton soft nofile 50000" >> /etc/security/limits.conf',
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  # Restart SSH to apply the new limits for new sessions
  exec { 'restart-session-to-apply-limits':
    command   => 'service ssh restart',
    path      => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    subscribe => [Exec['increase-hard-file-limit-holberton-user'], Exec['increase-soft-file-limit-holberton-user']],
  }
}

include user_limit

