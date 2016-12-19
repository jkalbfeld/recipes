execute 'start resin' do
	command "#{resin_cmd} status || #{resin_cmd} start"
end

execute 'deploy jwebmail' do
	command "#{resin_cmd} status && #{resin_cmd} deploy --server app-0 --port 80 --user admin --password jonishired /tmp/jwebmail.war"
end

