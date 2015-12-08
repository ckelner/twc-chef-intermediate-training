name "web"
description "Web Server"
run_list "role[base]", "recipe[apache::vhosts]"
