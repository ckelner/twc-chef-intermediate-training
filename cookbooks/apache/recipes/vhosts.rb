# This is a re-write of default.erb that was done live during the TWC training
package "httpd" do
  action :install
end

# Disable the default vhost
apache_vhost "welcome" do
  action :remove
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|
  # Enable an Apache Virtualhost
  apache_vhost site_name do
    site_port site_data["port"]
    action :create
    notifies :restart, "service[httpd]"
    site_nose site_data["nose"]
  end
end

service "httpd" do
  action [ :enable, :start ]
end
