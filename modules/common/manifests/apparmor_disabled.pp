# Turn off AppArmor
class common::apparmor_disabled {
  unless hiera('apparmor') {
    exec { 'apt-get -y remove apparmor':
      onlyif => 'dpkg -l apparmor',
    }
  }
}
