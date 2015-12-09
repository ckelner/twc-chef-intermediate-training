module CompanyName
  class FileHandler < Chef::Handler
    def report
      message = ''
      if run_status.updated_resources.empty?
        message += "No resources changed by chef-client - #{Time.now}"
      else
        run_status.updated_resources.each do |r|
          message += "The resource #{r.name} from"
          message += " #{r.cookbook_name}::#{r.recipe_name}"
          message += ":#{r.source_line} was changed.\n"
        end
      end
      File.write('/var/log/chef-client_updated.log', message)
    end
  end
end
