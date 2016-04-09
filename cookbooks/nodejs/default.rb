execute 'nodesource.gpg.key' do
  user 'root'
  command 'curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -'
  not_if 'apt-key list | grep "NodeSource"'
end

remote_file '/etc/apt/sources.list.d/nodesource.list' do
  owner 'root'
  group 'root'
end

execute 'apt-get update' do
  subscribes :run, "remote_file[/etc/apt/sources.list.d/nodesource.list]", :immediately
  action :nothing
end

package 'nodejs' do
  action :install
  options('-y')
end
