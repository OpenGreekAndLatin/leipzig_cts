# Set UTC timezone
class common::utc {
  file { '/etc/localtime':
    ensure => symlink,
    target => '/usr/share/zoneinfo/UTC',
  }
}
