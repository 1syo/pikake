package 'vim' do
  action :install
  options('-y')
end

execute 'editor' do
  user 'root'
  command 'update-alternatives --set editor /usr/bin/vim.basic'
  not_if "update-alternatives --display editor | grep 'link currently points to /usr/bin/vim.basic'"
end
