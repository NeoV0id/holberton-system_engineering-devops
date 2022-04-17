# Will modify configuration file

file_line { 'ssh_config':
  ensure   => 'present',
  path     => '/etc/ssh/ssh_config',
  match    => 'IdentityFile ~/.ssh/(\w)',
  line     => 'IdentityFile ~/.ssh/school',
  multiple => 'true'
  user     => 'root'
}

file_line { 'ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/sshd_config',
  match  => 'PasswordAuthentication yes',
  line   => 'PasswordAuthentication no'
}

exec { 'systemctl':
  command => 'systemctl restart sshd',
  path    => '/etc/ssh/sshd_config',
  user    => 'root'
}
