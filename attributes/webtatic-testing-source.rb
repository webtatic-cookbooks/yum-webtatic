default['yum']['webtatic-testing-source']['repositoryid'] = 'webtatic-testing-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

case el_version
when 5, 6
  default['yum']['webtatic-testing-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
when 7
  default['yum']['webtatic-testing-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
end

default['yum']['webtatic-testing-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Testing Source"
default['yum']['webtatic-testing-source']['mirrorlist'] = "http://mirror.webtatic.com/yum/el#{el_version}-testing/SRPMS/mirrorlist"

default['yum']['webtatic-testing-source']['failovermethod'] = nil
default['yum']['webtatic-testing-source']['gpgcheck'] = true
default['yum']['webtatic-testing-source']['enabled'] = false
default['yum']['webtatic-testing-source']['managed'] = false
