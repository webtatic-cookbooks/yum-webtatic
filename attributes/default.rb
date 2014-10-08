default['yum-webtatic']['url_scheme'] = if platform_family?('rhel') && node['platform_version'].to_i >= 7
                                          'https'
                                        else
                                          'http'
                                        end
