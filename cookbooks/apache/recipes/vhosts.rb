# This is a re-write of default.erb that was done live during the TWC training
package "httpd"

# Disable the default vhost
execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
  only_if do
    File.exists?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
node["apache"]["sites"].each do | site_name, site_data |
  # set document root
  document_root = "/srv/apache/#{site_name}"

  # Add a directory resource to create the document_root
  directory document_root do
    mode "0755"
    recurive true
  end

  # Add a template for Apache vhost conf
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source "custom1.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => site_data["port"]
    )
    notifies :restart, "service[httpd]"
  end

  # Add a template for Apache vhost conf
  template "/#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_name => site_name,
      :port => site_data["port"],
      :nose => site_date["nose"],
    )
  end
end
