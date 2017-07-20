# Dependencies for Capitains
class capitains::dependencies {

  class { 'redis::install': 
    redis_version     => '3.2.8',
  }

#  redis::server {
#    'master':
#      redis_memory    => '4g',
#  }

  class { 'python':
    version    => '3',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'present',
  }

  ensure_packages(hiera('capitains::deps'))
}#
