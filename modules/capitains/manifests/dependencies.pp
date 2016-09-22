# Dependencies for Capitains
class capitains::dependencies {
  class { 'redis': }

  class { 'python':
    version    => '3.4',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'present',
  }

  ensure_packages(hiera('capitains::deps'))
}
