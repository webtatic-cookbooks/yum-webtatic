default['yum']['webtatic-testing-source']['repositoryid'] = 'webtatic-testing-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_schema = node['yum-webtatic']['url_schema']

case el_version
when 5
  default['yum']['webtatic-testing-source']['gpgkey'] = "#{url_schema}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-testing-source']['gpgkey'] = "#{url_schema}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-testing-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Testing Source"

unless node['yum']['webtatic-testing-source']['baseurl']
  default['yum']['webtatic-testing-source']['mirrorlist'] = "#{url_schema}://mirror.webtatic.com/yum/el#{el_version}-testing/SRPMS/mirrorlist"
end

default['yum']['webtatic-testing-source']['failovermethod'] = 'priority'
default['yum']['webtatic-testing-source']['gpgcheck'] = true
default['yum']['webtatic-testing-source']['enabled'] = false
default['yum']['webtatic-testing-source']['managed'] = false
