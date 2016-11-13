default['yum']['webtatic-testing-debuginfo']['repositoryid'] = 'webtatic-testing-debuginfo'

case node['platform']
when 'amazon'
  el_version = 6
else
  el_version = node['platform_version'].to_i
end

url_scheme = node['yum-webtatic']['url_scheme']

case el_version
when 5
  default['yum']['webtatic-testing-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
when 6, 7
  default['yum']['webtatic-testing-debuginfo']['gpgkey'] = "#{url_scheme}://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el#{el_version}"
end

default['yum']['webtatic-testing-debuginfo']['description'] = "Webtatic Repository EL#{el_version} - $basearch - Testing Debug"

unless node['yum']['webtatic-testing-debuginfo']['baseurl']
  default['yum']['webtatic-testing-debuginfo']['mirrorlist'] = "#{url_scheme}://mirror.webtatic.com/yum/el#{el_version}-testing/$basearch/debug/mirrorlist"
end

default['yum']['webtatic-testing-debuginfo']['failovermethod'] = 'priority'
default['yum']['webtatic-testing-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-testing-debuginfo']['enabled'] = false
default['yum']['webtatic-testing-debuginfo']['managed'] = false
