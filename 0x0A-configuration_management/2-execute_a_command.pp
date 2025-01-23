# This manifest kills a process named 'killmenow' using the pkill command.

exec { 'kill_process':
  command => 'pkill killmenow',
  path    => '/usr/bin:/bin',
  onlyif  => 'pgrep killmenow',
}
