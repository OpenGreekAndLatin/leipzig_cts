# Webserver setup for Capitains
class capitains::nginx {
  class { 'nginx': }

  nginx::resource::upstream { 'upstream_app':
    members => ['localhost:5000'],
  }

  nginx::resource::vhost{ $capitains::domain:
    www_root            => $capitains::www_root,
    location_cfg_append => {
      'try_files'  => '$uri @proxy_to_app',
      'add_header' => ["'Access-Control-Allow-Origin' '*'","'Access-Control-Allow-Methods' 'GET, POST, OPTIONS'"],
    },
  }

  nginx::resource::location{'@proxy_to_app':
    proxy => 'http://upstream_app',
    vhost => $capitains::domain,
  }
}
