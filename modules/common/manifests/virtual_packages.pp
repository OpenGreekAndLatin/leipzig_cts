# Declare virtual packages here
class common::virtual_packages {
  @package { ['build-essential',
              'libssl-dev']:
    ensure => installed }
}
