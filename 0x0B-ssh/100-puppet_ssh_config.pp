# Will modify configuration file

File['ssh_config'] {
  mode => '0600'
}

file_line { 'ssh_config':
  ensure => 'created',
  path   => '/etc/ssh/ssh_config',
  match  => 'IdentityFile ~/.ssh/\w',
  line   => 'IdentityFile ~/.ssh/school',
  user   => 'root'
}

file_line { 'ssh_config':
  ensure => 'created',
  path   => '/etc/ssh/ssh_config',
  match  => 'PasswordAuthentication yes',
  line   => 'PasswordAuthentication no',
  user   => 'root'
}
exec { 'systemctl':
  command => 'systemctl restart sshd',
  user    => 'root'
}
