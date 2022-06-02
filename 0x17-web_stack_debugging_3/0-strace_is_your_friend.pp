# This script will fix a web_stack

exec { 'Fix a p':
  path    => [ '/bin/', '/sbin/', '/usr/bin', '/usr/sbin/'],
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php'
}
