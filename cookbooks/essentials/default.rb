include_recipe 'attributes'

node[:essentials][:packages].each do |pkg|
  package pkg do
    action :install
    options('-y')
  end
end
