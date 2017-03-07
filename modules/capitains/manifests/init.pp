# Capitains
class capitains($www_root,
                $data_root,
                $app_root,
                $redis_host,
                $repos,
                $workdir,
                $venvdir,
                $ci_url,
                $cache_dir,
                $analytics_id) {
  include capitains::nginx
  include capitains::dependencies
  include capitains::repos

  file { $capitains::app_root:
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
  }

  file { $capitains::data_root:
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
  }

  file { "${app_root}/requirements-py3.txt":
    content => template('capitains/requirements-py3.txt.erb'),
    notify  => Python::Virtualenv[$capitains::app_root],
  }

  file { "${app_root}/manager.py":
    content => template('capitains/manager.py.erb'),
    notify  => Python::Virtualenv[$capitains::app_root],
  }

  file { "${app_root}/app.py":
    content => template('capitains/app.py.erb'),
    notify  => Python::Virtualenv[$capitains::app_root],
  }

  file { "${app_root}/hookclean.py":
    content => template('capitains/hookclean.py.erb'),
  }

  python::virtualenv { $capitains::app_root:
    ensure       => present,
    require      => Class['capitains::dependencies'],
    version      => '3',
    requirements => "${capitains::app_root}/requirements-py3.txt",
    venv_dir     => $capitains::venvdir,
    cwd          => $capitains::app_root,
    notify       => Exec['restart-gunicorn'],
  }

  python::gunicorn { 'vhost':
    ensure     => present,
    virtualenv => $capitains::venvdir,
    dir        => $capitains::app_root,
    bind       => 'localhost:5000',
    appmodule  => 'app:app',
    owner      => 'www-data',
    group      => 'www-data',
  }

  exec { 'restart-gunicorn':
    command     => '/usr/sbin/service gunicorn restart',
    refreshonly => true,
    require     => Python::Gunicorn['vhost'],
  }
}
