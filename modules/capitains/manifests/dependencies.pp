# Dependencies for Capitains
class capitains::dependencies {
  class { 'redis': 
    redis_version     => '3.2.8',
    redis_memory      => '2g',
    redis_dir         => '/local/redis-data/'
  }

  class { 'python':
    version    => '3',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'present',
  }

  ensure_packages(hiera('capitains::deps'))
}
