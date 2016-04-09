require 'itamae/plugin/resource/authorized_keys'

authorized_keys 'kitt' do
  github 'kittbot'
end

user 'kitt' do
  shell '/bin/bash'
  create_home true
end

%w(
  .gemrc
  .profile
  .select-editor
).each do |rcfile|
  remote_file "/home/kitt/#{rcfile}" do
    owner user
    group user
    source "files/#{rcfile}"
  end
end
