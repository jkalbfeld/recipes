resin_cmd = "c:/java/bin/java -jar c:/resin/lib/resin.jar"
execute 'start resin' do
	command "#{resin_cmd} status || #{resin_cmd} start"
end

cookbook_file "/tmp/jwebmail.war" do
	source "jwebmail.war"
end

execute 'deploy jwebmail' do
	command "#{resin_cmd} status && #{resin_cmd} deploy --user admin --password jonishired /tmp/jwebmail.war"
end
