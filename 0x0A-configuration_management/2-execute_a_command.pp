#kills a process named killmenow

exec {
  command  => 'pkill'
}
