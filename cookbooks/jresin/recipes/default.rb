resin_alias = "c:/resin"
resin_version = "4.0.49"
resin_file = "c:/resin-#{resin_version}.zip"
resin_directory = "c:/resin-#{resin_version}"

remote_file resin_file do
  source "http://www.caucho.com/download/resin-#{resin_version}.zip"
  not_if { ::File.exists?(resin_file) }
end

execute 'unzip resin' do
  command "unzip -o resin-#{resin_version}.zip -d /c/" 
  creates resin_directory
  not_if { ::File.exists?(resin_directory) }
end

template "#{resin_directory}/conf/resin.properties" do
	source 'resin.properties'
end

link resin_alias do
  to resin_directory
end

service "resin_service" do
	 supports :status => true, :restart => true, :start => true, :stop => true
	 start_command "c:/java/bin/java -jar c:/resin/lib/resin.jar start"
	 restart_command "c:/java/bin/java -jar c:/resin/lib/resin.jar restart"
	 status_command "c:/java/bin/java -jar c:/resin/lib/resin.jar status"
	 stop_command "c:/java/bin/java -jar c:/resin/lib/resin.jar stop"
	 action [ :enable, :start ]
end

