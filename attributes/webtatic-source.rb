default['yum']['webtatic-source']['repositoryid'] = 'webtatic-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-source']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-source']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Source"

unless node['yum']['webtatic-source']['baseurl']
  default['yum']['webtatic-source']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}/SRPMS/mirrorlist"
end

default['yum']['webtatic-source']['failovermethod'] = 'priority'
default['yum']['webtatic-source']['gpgcheck'] = true
default['yum']['webtatic-source']['enabled'] = false
default['yum']['webtatic-source']['managed'] = false
