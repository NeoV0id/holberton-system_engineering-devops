# Will modify configuration file

File['ssh_config'] {
  mode => '0600'
}

file_line { 'ssh_config':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '.ssh/school',
  match  => '.ssh/[.+]'
}

file_line { 'ssh_config':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => 'PasswordAuthentication yes'
}
