# Wrapper script to log (cron)job output to syslog
class common::loggit {
  utils::script { 'loggit':
    source => 'puppet:///modules/common/loggit.rb',
  }
}
