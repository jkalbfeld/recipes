resin_cmd = "c:/java/bin/java -jar c:/resin/lib/resin.jar"
execute 'start resin' do
	command "#{resin_cmd} status || #{resin_cmd} start"
end

cookbook_file "/tmp/guacamole.war" do
	source "guacamole-0.9.9.war"
end

execute 'deploy guacamole' do
	command "#{resin_cmd} status && #{resin_cmd} deploy --user admin --password jonishired /tmp/guacamole.war"
end
