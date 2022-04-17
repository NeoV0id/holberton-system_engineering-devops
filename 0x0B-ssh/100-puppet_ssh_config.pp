# Will modify configuration file

include stdlib
file_line { 'ssh_config':
  ensure   => 'present',
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/school',
  multiple => 'true'
}

file_line { 'ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no'
}
