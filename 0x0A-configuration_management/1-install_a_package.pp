#install puppet-lint

package {'puppet-lint':
  ensure   => 'installed',
  ensure   => '2.5.0',
  provider => 'gem'
}
