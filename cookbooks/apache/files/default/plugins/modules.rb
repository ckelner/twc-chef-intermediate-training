Ohai.plugin(:Apache) do
  provides "apache/modules"

  collect_data(:default) do
    apache Mash.new
    modules = shell_out("apachectl -t -D DUMP_MODULES")
    apache[:modules] = modules.stdout
  end
end
