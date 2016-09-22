# Repo data for Capitains
class capitains::repos {
  file { $capitains::workdir:
    ensure => directory,
  }

  $capitains::repos.each |Hash $repo| {
    $reponame = $repo['name']
    exec { "clone-repo-${reponame}":
      cwd     => $capitains::workdir,
      command => "/usr/bin/git clone ${repo['url']}",
      creates => "${capitains::workdir}/${reponame}",
      require => [File[$capitains::workdir], File[$capitains::data_root]],
      notify  => Exec['force-update-repos (first time only)'],
    }
  }

  file { '/usr/local/bin/update_capitains_repos':
    content => template('capitains/update_capitains_repos.rb.erb'),
    mode    => '0775',
    require => [Python::Virtualenv[$capitains::app_root],
                File[$capitains::workdir],
                File[$capitains::data_root]],
  }

  exec { 'update-repos':
    command => '/usr/local/bin/update_capitains_repos',
    require => File['/usr/local/bin/update_capitains_repos'],
  }

  exec { 'force-update-repos (first time only)':
    command     => '/usr/local/bin/update_capitains_repos --force',
    require     => File['/usr/local/bin/update_capitains_repos'],
    refreshonly => true,
  }
}
