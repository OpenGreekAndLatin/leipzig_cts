#!/usr/bin/ruby

$job=ARGV.shift
commandline=ARGV.join(' ')

def log(message)
  message.split(/\n/).each do |line|
    system("/usr/bin/logger -t \"#{$job}\" -- \"#{line}\"")
  end
end

log "---- Starting job '#{$job}' ----"
output=`#{commandline} 2>&1`
status=$?.exitstatus
log output
log "----Completed job '#{$job}' with exit status #{status} ----"
