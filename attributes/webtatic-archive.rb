default['yum']['webtatic-archive']['repositoryid'] = 'webtatic-archive'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-archive']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-archive']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-archive']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Archive"

unless node['yum']['webtatic-archive']['baseurl']
  default['yum']['webtatic-archive']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}-archive/$basearch/mirrorlist"
end

default['yum']['webtatic-archive']['failovermethod'] = 'priority'
default['yum']['webtatic-archive']['gpgcheck'] = true
default['yum']['webtatic-archive']['enabled'] = false
default['yum']['webtatic-archive']['managed'] = false
