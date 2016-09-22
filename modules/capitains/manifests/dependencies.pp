# Dependencies for Capitains
class capitains::dependencies {
  class { 'redis': }

  class { 'python':
    version    => '3',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
  }

  ensure_packages(hiera('capitains::deps'))
}
