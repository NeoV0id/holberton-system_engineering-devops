# Will modify configuration file

file { '/etc/ssh/ssh_config':
  path    => '/etc/ssh/ssh_config',
  ensure  => 'exist',
  alias   => 'ssh_config'
}

File['ssh_config'] {
  mode => '0600'
}

file_line { 'ssh_config':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '.ssh/school',
  match  => 'IdentityFile +$',
}

file_line { 'ssh_config':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => 'PasswordAuthentication yes',
  command => ['sudo systemctl restart sshd']
}
