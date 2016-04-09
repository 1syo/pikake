package 'software-properties-common' do
  action :install
  options('-y')
end

execute 'ppa:chris-lea/redis-server' do
  user 'root'
  command 'apt-add-repository -y ppa:chris-lea/redis-server'
  not_if 'apt-key list | grep "Brightbox"'
end

execute "apt-get update" do
  subscribes :run, "execute[ppa:chris-lea/redis-server]", :immediately
  action :nothing
end

package 'redis-server'

service 'redis-server' do
  action [:enable, :start]
end
