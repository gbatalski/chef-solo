# borrowed from git://github.com/pjungwir/illuminatedcomputing-chef-solo.git
root = File.absolute_path(File.dirname(__FILE__))

data_bag_path root + '/data-bags'
file_cache_path root

# Later entries override earlier ones:
cookbook_path [root + '/orig-cookbooks', root + '/cookbooks']