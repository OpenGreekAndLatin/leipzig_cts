# Deploy a script file to /usr/local/bin
define utils::script($source) {
  file { "/usr/local/bin/${name}":
    source => $source,
    mode   => '0755',
  }
}
