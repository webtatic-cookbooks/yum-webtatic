default['yum']['webtatic-archive-source']['repositoryid'] = 'webtatic-archive-source'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

case el_version
when 5, 6
  default['yum']['webtatic-archive-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
when 7
  default['yum']['webtatic-archive-source']['gpgkey'] = 'http://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
end

default['yum']['webtatic-archive-source']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Archive Source"
default['yum']['webtatic-archive-source']['mirrorlist'] = "http://mirror.webtatic.com/yum/el#{el_version}-archive/SRPMS/mirrorlist"

default['yum']['webtatic-archive-source']['failovermethod'] = nil
default['yum']['webtatic-archive-source']['gpgcheck'] = true
default['yum']['webtatic-archive-source']['enabled'] = false
default['yum']['webtatic-archive-source']['managed'] = false