name "base"
description "Base Server Role"
run_list "recipe[chef-client::config]", "recipe[chef-client::delete_validation]", "recipe[chef-client]", "recipe[ntp]", "recipe[motd]", "recipe[users]"
