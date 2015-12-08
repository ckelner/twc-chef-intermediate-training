twc-chef-intermediate-training
===============

This is a clone of [chef-training/chef-fundamentals-repo](https://github.com/chef-training/chef-fundamentals-repo) for The Weather Company ([weather.com](weather.com)) Intermediate Chef training.

Training PDF (internal TWC Google Drive) [Chef_Intermediate_v1.2.1.pdf](https://drive.google.com/a/weather.com/file/d/0B7e8h9mtaJSSbDZ3WlkzZDBpcUE/view?usp=sharing)

# Notes

- If you attempt to perform a `knife bootstrap` with you validator key in `.chef` you'll get an authentication error.  See [https://www.chef.io/blog/2015/04/16/validatorless-bootstraps/](https://www.chef.io/blog/2015/04/16/validatorless-bootstraps/)
- Order of attribute precedence:
  ![img](https://docs.chef.io/_images/overview_chef_attributes_table.png)
  - For more, see: [https://docs.chef.io/attributes.html](https://docs.chef.io/attributes.html)

# Common commands

## Knife

### From workstation

- `knife cookbook upload -a`
  - uploads all cookbooks in this repo
- `knife role from file base.rb web.rb`
  - uploads all roles in this repo
- `knife environment from file dev.rb production.rb`
  - uploads all the environments in this repo
- `knife upload data_bags`
  - uploads all data bags in this repo
- `knife bootstrap <ipaddr> -x <user> -P <pass> --sudo -N <nodename> -r 'role[<rolename>]' --bootstrap-version <ver>`
  - bootstraps an existing node using user/name password and users key from Chef org.  Does not use the validator key.

# Original Readme from chef-training/chef-fundamentals-repo

All installations require a central workspace known as the chef-repo. This is a place where primitive objects--cookbooks, roles, environments, data bags, and chef-repo configuration files--are stored and managed.

The chef-repo should be kept under version control, such as [git](http://git-scm.org), and then managed as if it were source code.

Knife Configuration
-------------------
Knife is the [command line interface](http://docs.opscode.com/knife.html) for Chef. The chef-repo contains a .chef directory (which is a hidden directory by default) in which the Knife configuration file (knife.rb) is located. This file contains configuration settings for the chef-repo.

The knife.rb file is automatically created by the starter kit. This file can be customized to support configuration settings used by [cloud provider options](http://docs.opscode.com/plugin_knife.html) and custom [knife plugins](http://docs.opscode.com/plugin_knife_custom.html).

Also located inside the .chef directory are .pem files, which contain private keys used to authenticate requests made to the Chef server. The USERNAME.pem file contains a private key unique to the user (and should never be shared with anyone). The ORGANIZATION-validator.pem file contains a private key that is global to the entire organization (and is used by all nodes and workstations that send requests to the Chef server).

More information about knife.rb configuration options can be found in [the documentation for knife](http://docs.opscode.com/config_rb_knife.html).

Cookbooks
---------
A cookbook is the fundamental unit of configuration and policy distribution. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to the Chef server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

Roles
-----
Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

Getting Started
-------------------------
Now that you have the chef-repo ready to go, check out [Learn Chef](https://learnchef.opscode.com/quickstart/workstation-setup/) to proceed with your workstation setup. If you have any questions about Enterprise Chef you can always ask [our support team](https://www.opscode.com/support/tickets/new) for a helping hand.
