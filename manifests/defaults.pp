Exec {
  path      => ['/usr/bin','/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
  logoutput => on_failure,
}

Package {
  allow_virtual => true,
}