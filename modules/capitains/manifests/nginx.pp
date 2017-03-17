# Webserver setup for Capitains
class capitains::nginx {

  class { '::nginx::config':

    gzip                => "on",
    gzip_disable        => "msie6",
    gzip_vary           => "on",
    gzip_proxied        => "any",
    gzip_comp_level     => "6",
    gzip_buffers        => "16 8k",
    gzip_http_version   => "1.1",
    gzip_types          => ["text/plain", "text/css", "application/json", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript"],
  }

  class { 'nginx': 
  }

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
