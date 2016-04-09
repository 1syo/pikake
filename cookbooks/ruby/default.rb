include_recipe 'attributes'

# for 14.04
package 'software-properties-common' do
  action :install
  options('-y')
end

execute 'ppa:brightbox/ruby-ng' do
  user 'root'
  command 'apt-add-repository -y ppa:brightbox/ruby-ng'
  not_if 'apt-key list | grep "Brightbox"'
end

execute "apt-get update" do
  subscribes :run, "execute[ppa:brightbox/ruby-ng]", :immediately
  action :nothing
end

node[:ruby][:packages].each do |pkg|
  package pkg do
    action :install
    options('-y')
  end
end

execute 'set default ruby version' do
  user 'root'
  command "ruby-switch --set #{node[:ruby][:default]}"
  not_if "ruby -v | grep #{node[:ruby][:version]}"
end

node[:ruby][:gems].each { |gem|
  gem_package gem do
    user 'root'
    action [:install, :upgrade]
  end
}
