default['yum-webtatic']['url_scheme'] = if platform_family?('rhel') && node['platform_version'].to_i >= 7
                                          'https'
                                        else
                                          'http'
                                        end

default['yum-webtatic']['mirrorlist'] = if node['yum-webtatic']['url_scheme'] == 'http'
                                          'mirrorlist'
                                        else
                                          "mirrorlist_#{node['yum-webtatic']['url_scheme']}"
                                        end
