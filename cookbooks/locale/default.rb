execute 'locale' do
  command "locale-gen ja_JP.UTF-8"
  not_if "grep -c 'ja_JP.UTF-8' /var/lib/locales/supported.d/local"
end
