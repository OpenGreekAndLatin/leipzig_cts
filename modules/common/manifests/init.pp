# Stuff all servers should have
class common {
  include common::apparmor_disabled
  include common::chkrootkit
  include common::loggit
  include common::ntp
  include common::utc
  include common::virtual_packages
}
