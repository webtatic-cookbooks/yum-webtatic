if platform_family?('rhel') && node['platform_version'].to_i < 6
  default['yum-webtatic']['url_scheme'] = 'http'
else
  default['yum-webtatic']['url_scheme'] = 'https'
end
