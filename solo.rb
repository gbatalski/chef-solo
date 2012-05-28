# borrowed from git://github.com/pjungwir/illuminatedcomputing-chef-solo.git
root = File.absolute_path(File.dirname(__FILE__))

log_level                :info
log_location             STDOUT

data_bag_path root + '/data-bags'
file_cache_path root + '/cache'

# Later entries override earlier ones:
cookbook_path [root + '/orig-cookbooks', root + '/cookbooks']