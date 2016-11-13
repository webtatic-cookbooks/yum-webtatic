default['yum']['webtatic']['repositoryid'] = 'webtatic'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic']['sslverify'] = false
end

case el_version
when 5
  default['yum']['webtatic']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic']['description'] = "Webtatic Repository EL#{el_version} - $basearch"

unless node['yum']['webtatic']['baseurl']
  default['yum']['webtatic']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}/$basearch/mirrorlist"
end

default['yum']['webtatic']['failovermethod'] = 'priority'
default['yum']['webtatic']['gpgcheck'] = true
default['yum']['webtatic']['enabled'] = true
default['yum']['webtatic']['managed'] = true
