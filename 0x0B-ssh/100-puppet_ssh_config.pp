# 100-puppet_ssh_config.pp
# Puppet manifest to configure SSH client to use a specific private key and disable password authentication

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^#?IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^#?PasswordAuthentication',
}

