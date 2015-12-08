Ohai.plugin(:Apache) do
  provides "apache/modules"

  collect_data(:default) do
    apache Mash.new
    apache[:modules] = { :static => [], :shared => [] }
    modules = shell_out("apachectl -t -D DUMP_MODULES")
    modules.stdout.each_line do |line|
      fullkey, value = line.split("(", 2).map { |token| token.strip }
      apache_module = fullkey.gsub("_module","")
      dso_type = value.to_s.chomp("\)")
      if dso_type.match(/shared/)
        apache[:modules][:shared] << apache_module
      elsif dso_type.match(/static/)
        apache[:modules][:static] << apache_module
      end
    end
  end
end
