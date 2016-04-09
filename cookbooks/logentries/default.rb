execute 'pgp.mit.edu' do
  user 'root'
  command 'gpg --keyserver pgp.mit.edu --recv-keys C43C79AD && gpg -a --export C43C79AD | apt-key add -'
  not_if "apt-key list | grep 2048R/C43C79AD"
end

remote_file '/etc/apt/sources.list.d/logentries.list' do
  owner 'root'
  group 'root'
end

execute 'apt-get update' do
  subscribes :run, 'remote_file[/etc/apt/sources.list.d/logentries.list]', :immediately
  action :nothing
end

package 'logentries' do
  action :install
  options("-y")
end

package 'logentries-daemon' do
  action :install
  options("-y")
end

execute 'le regsiter' do
  user 'root'
  command "le register --hostname=pikake2 --account-key=#{ENV['ACCOUNT_KEY']}"
  only_if 'test -n "$ACCOUNT_KEY"'
  not_if 'test -e /etc/le/config'
end

execute 'le follow /var/log/auth.log' do
  user 'root'
  command "le follow /var/log/auth.log --account-key=#{ENV['ACCOUNT_KEY']}"
  only_if 'test -n "$ACCOUNT_KEY"'
  not_if 'le followed /var/log/auth.log | grep Following'
end

service 'logentries' do
  action :restart
end
