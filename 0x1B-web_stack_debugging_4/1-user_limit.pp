# Reconfigure the OS for 'holberton' to login and open a file without any error message
class user_limit {
  
  # Increase the soft file limit for the holberton user
  exec { 'increase-soft-file-limit-holberton-user':
    command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
  }

  # Increase the hard file limit for the holberton user
  exec { 'increase-hard-file-limit-holberton-user':
    command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
  }

  # Restart the session to apply the new limits
  exec { 'restart-session-to-apply-limits':
    command => 'pkill -KILL -u holberton',
    path    => '/usr/bin:/bin',
    refreshonly => true,
    notify   => Exec['increase-soft-file-limit-holberton-user'],
  }
}

include user_limit

