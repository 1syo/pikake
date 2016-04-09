package 'ufw' do
  action :install
  options('-y')
end

execute 'reset' do
  user 'root'
  command 'yes | ufw reset'
end

execute 'default deny' do
  user 'root'
  command 'ufw default deny'
end

execute 'allow ssh' do
  user 'root'
  command 'ufw allow 22'
end

execute 'enable' do
  user 'root'
  command 'yes | ufw enable'
end

service 'ufw' do
  action :restart
end
