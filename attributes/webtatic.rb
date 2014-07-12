default['yum']['webtatic']['repositoryid'] = 'webtatic'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

case el_version
when 5, 6
  default['yum']['webtatic']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
when 7
  default['yum']['webtatic']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
end

default['yum']['webtatic']['description'] = "Webtatic Repository EL#{el_version} - $basearch"
default['yum']['webtatic']['mirrorlist'] = "http://mirror.webtatic.com/yum/el#{el_version}/$basearch/mirrorlist"

default['yum']['webtatic']['failovermethod'] = nil
default['yum']['webtatic']['gpgcheck'] = true
default['yum']['webtatic']['enabled'] = true
default['yum']['webtatic']['managed'] = true
