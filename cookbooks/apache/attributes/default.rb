default["apache"]["indexfile"] = "index1.html"
default["apache"]["sites"]["clowns"] = { "port" => 80, "nose" => "red" }
default["apache"]["sites"]["lions"] = { "port" => 8080, "nose" => "striped" }
default["apache"]["sites"]["bears"] = { "port" => 8443, "nose" => "black" }
default["apache"]["sites"]["zebras"] = { "port" => 8081, "nose" => "striped" }

default['apache']['apache-package'] = case node['platform']
  when 'ubuntu' then 'apache2'
  when 'centos' then 'httpd'
end
