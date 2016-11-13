default['yum']['webtatic-debuginfo']['repositoryid'] = 'webtatic-debuginfo'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-debuginfo']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Debug"

unless node['yum']['webtatic-debuginfo']['baseurl']
  default['yum']['webtatic-debuginfo']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}/$basearch/debug/mirrorlist"
end

default['yum']['webtatic-debuginfo']['failovermethod'] = 'priority'
default['yum']['webtatic-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-debuginfo']['enabled'] = false
default['yum']['webtatic-debuginfo']['managed'] = false
