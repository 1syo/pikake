execute 'timezone' do
  command <<-EOH
echo "Asia/Tokyo" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
  EOH
  not_if "date | grep -c 'JST'"
end
