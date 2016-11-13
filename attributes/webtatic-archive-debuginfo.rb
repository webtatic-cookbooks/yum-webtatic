default['yum']['webtatic-archive-debuginfo']['repositoryid'] = 'webtatic-archive-debuginfo'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-archive-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-archive-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-archive-debuginfo']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Archive Debug"

unless node['yum']['webtatic-archive-debuginfo']['baseurl']
  default['yum']['webtatic-archive-debuginfo']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}-archive/$basearch/debug/mirrorlist"
end

default['yum']['webtatic-archive-debuginfo']['failovermethod'] = 'priority'
default['yum']['webtatic-archive-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-archive-debuginfo']['enabled'] = false
default['yum']['webtatic-archive-debuginfo']['managed'] = false
