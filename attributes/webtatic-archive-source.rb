default['yum']['webtatic-archive-source']['repositoryid'] = 'webtatic-archive-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-archive-source']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-archive-source']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-archive-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Archive Source"

unless node['yum']['webtatic-archive-source']['baseurl']
  default['yum']['webtatic-archive-source']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}-archive/SRPMS/mirrorlist"
end

default['yum']['webtatic-archive-source']['failovermethod'] = 'priority'
default['yum']['webtatic-archive-source']['gpgcheck'] = true
default['yum']['webtatic-archive-source']['enabled'] = false
default['yum']['webtatic-archive-source']['managed'] = false
