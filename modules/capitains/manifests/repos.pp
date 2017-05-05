# Repo data for Capitains
class capitains::repos {
  $update_flags = hiera('capitains::repos_update_flags')

  file { $capitains::workdir:
    ensure => directory,
  }


  file { '/usr/local/bin/update_capitains_repos':
    content => template('capitains/update_capitains_repos.rb.erb'),
    mode    => '0775',
    require => [Python::Virtualenv[$capitains::app_root],
                File[$capitains::workdir],
                File[$capitains::data_root]],
  }

  exec { 'update-repos':
    command => "/usr/local/bin/update_capitains_repos ${update_flags}",
    require => File['/usr/local/bin/update_capitains_repos'],
  }

  exec { 'force-update-repos (first time only)':
    command     => '/usr/local/bin/update_capitains_repos --force',
    require     => File['/usr/local/bin/update_capitains_repos'],
    refreshonly => true,
  }
}
