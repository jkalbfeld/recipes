resin_user = node[:resin][:user]
resin_alias = node[:resin][:home]
resin_base_dir = node[:resin][:base_dir]
resin_directory = "c:/resin-#{node[:resin][:version]}"
resin_file = "c:/resin-#{node[:resin][:version]}.zip"
maven_search_path = "http://search.maven.org/remotecontent?filepath="
packages = %w( htop tree wget pcre )

directory resin_base_dir do
  owner resin_user
end


# Install all packages.
packages.each do |library|
  package library
end

remote_file resin_file do
  source "http://caucho.com/download/resin-4.0.49.zip"
  not_if { ::File.exists?(resin_file) }
end

execute 'unzip resin' do
  command "unzip resin-4.0.49.zip --directory #{resin_base_dir}"
  creates resin_directory
  user resin_user
  not_if { ::File.exists?(resin_directory) }
end

link resin_alias do
  to resin_directory
  user resin_user
end
