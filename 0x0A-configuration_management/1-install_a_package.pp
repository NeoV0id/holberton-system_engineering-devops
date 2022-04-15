#install puppet-lint

package { 'puppet-lint':
  ensure   => '2.5.0',
  command  => 'install',
  provider => 'gem',
  source   => 'https://rubygems.org/'
}
