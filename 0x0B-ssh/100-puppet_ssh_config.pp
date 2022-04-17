# Will modify configuration file

File['ssh_config'] {
  mode => '0600'
}

file_line { 'ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  match  => 'IdentityFile ~/.ssh/\w',
  line   => 'IdentityFile ~/.ssh/school',
  user   => 'root'
}

file_line { 'ssh_config':
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  ensure => 'present'
}

exec { 'systemctl':
  command => 'systemctl restart sshd',
  user    => 'root'
}
