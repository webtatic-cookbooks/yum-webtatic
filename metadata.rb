name             'yum-webtatic'
maintainer       'Andy Thompson'
maintainer_email 'andy@webtatic.com'
license          'Apache 2.0'
description      'Installs/Configures yum-webtatic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.7.1'
recipe           'default', 'Adds Webtatic repository metadata to yum'

depends 'yum', '>= 0.0.0'
depends 'yum-epel'

supports 'rhel', '>= 5.0'
supports 'centos', '>= 5.0'
