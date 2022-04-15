#install puppet-lint

package { 'puppet-lint':
  name     => 'puppet-lint',
  command  => 'gem install',
  ensure   => '2.5.0',
}

