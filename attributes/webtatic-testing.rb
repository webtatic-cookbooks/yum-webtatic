default['yum']['webtatic-testing']['repositoryid'] = 'webtatic-testing'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5, 6
  default['yum']['webtatic-testing']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 7
  default['yum']['webtatic-testing']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7"
end

default['yum']['webtatic-testing']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Testing"

unless node['yum']['webtatic-testing']['baseurl']
  default['yum']['webtatic-testing']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}-testing/$basearch/#{node['yum-webtatic']['mirrorlist']}"
end

default['yum']['webtatic-testing']['failovermethod'] = nil
default['yum']['webtatic-testing']['gpgcheck'] = true
default['yum']['webtatic-testing']['enabled'] = false
default['yum']['webtatic-testing']['managed'] = false
