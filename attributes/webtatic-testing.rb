default['yum']['webtatic-testing']['repositoryid'] = 'webtatic-testing'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

case el_version
when 5, 6
  default['yum']['webtatic-testing']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
when 7
  default['yum']['webtatic-testing']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
end

default['yum']['webtatic-testing']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Testing"
default['yum']['webtatic-testing']['mirrorlist'] = "http://mirror.webtatic.com/yum/el#{el_version}-testing/$basearch/mirrorlist"

default['yum']['webtatic-testing']['failovermethod'] = nil
default['yum']['webtatic-testing']['gpgcheck'] = true
default['yum']['webtatic-testing']['enabled'] = false
default['yum']['webtatic-testing']['managed'] = false
