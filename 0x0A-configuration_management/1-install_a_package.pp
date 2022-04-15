#install puppet-lint

package {'puppet-lint':
  command  => 'gem install puppet-lint',
  ensure   => '2.5.0',
}
