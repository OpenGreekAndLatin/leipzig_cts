# Download a given URL to a given path
define utils::remote_file($source) {
  $path = $name
  exec { "/usr/bin/wget -q -O ${path} ${source}":
    creates => $path,
  }
}
