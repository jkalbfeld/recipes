resin_alias = "c:/resin"
resin_version = "4.0.49"
resin_file = "c:/resin-#{resin_version}.zip"
resin_directory = "c:/resin-#{resin_version}"

directory "#{resin_directory}" do
	 action :create
end

remote_file resin_file do
  source "http://www.caucho.com/download/resin-#{resin_version}.zip"
  not_if { ::File.exists?(resin_file) }
end

execute 'unzip resin' do
	command "unzip resin-#{resin_version}.zip --directory #{resin_directory}"
  creates resin_directory
  not_if { ::File.exists?(resin_directory) }
end

link resin_alias do
  to resin_directory
end
