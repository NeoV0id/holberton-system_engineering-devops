# Will modify configuration file

File['ssh_config'] {
  mode => '0600'
}

file_line { 'ssh_config':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  match  => 'IdentityFile ~/.ssh/\w',
  user   => 'root'
}

file_line { 'ssh_config':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => 'PasswordAuthentication yes',
  user   => 'root'
}
exec { 'systemctl':
  command => 'systemctl restart sshd',
  user    => 'root'
}
