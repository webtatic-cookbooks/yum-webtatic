yum-webtatic Cookbook
============

The yum-webtatic cookbook takes over management of the default
repositoryids shipped with webtatic-release. It allows attribute
manipulation of `webtatic`, `webtatic-debuginfo`, `webtatic-source`,
`webtatic-archive`, `webtatic-archive-debuginfo`, `webtatic-archive-source`
`webtatic-testing`, `webtatic-testing-debuginfo`, and `webtatic-testing-source`.

Requirements
------------
* Chef 11 or higher
* yum cookbook version 3.0.0 or higher

Attributes
----------
The following attributes are set by default depending on EL version

``` ruby
default['yum-webtatic']['use_scheme'] = 'https'
```

``` ruby
default['yum']['webtatic']['repositoryid'] = depends on EL version
default['yum']['webtatic']['description'] = depends on EL version
default['yum']['webtatic']['mirrorlist'] = depends on EL version
default['yum']['webtatic']['gpgkey'] = depends on EL version
default['yum']['webtatic']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installed
default['yum']['webtatic']['gpgcheck'] = true
default['yum']['webtatic']['enabled'] = true
default['yum']['webtatic']['managed'] = true
```

``` ruby
default['yum']['webtatic-debuginfo']['repositoryid'] = depends on EL version
default['yum']['webtatic-debuginfo']['description'] = depends on EL version
default['yum']['webtatic-debuginfo']['mirrorlist'] = depends on EL version
default['yum']['webtatic-debuginfo']['gpgkey'] = depends on EL version
default['yum']['webtatic-debuginfo']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installeddefault['yum']['webtatic-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-debuginfo']['enabled'] = false
default['yum']['webtatic-debuginfo']['managed'] = false
```

``` ruby
default['yum']['webtatic-source']['repositoryid'] = depends on EL version
default['yum']['webtatic-source']['description'] = depends on EL version
default['yum']['webtatic-source']['mirrorlist'] = depends on EL version
default['yum']['webtatic-source']['gpgkey'] = depends on EL version
default['yum']['webtatic-source']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installeddefault['yum']['webtatic-source']['gpgcheck'] = true
default['yum']['webtatic-source']['enabled'] = false
default['yum']['webtatic-source']['managed'] = false
```
``` ruby
default['yum']['webtatic-archive']['repositoryid'] = depends on EL version
default['yum']['webtatic-archive']['description'] = depends on EL version
default['yum']['webtatic-archive']['mirrorlist'] = depends on EL version
default['yum']['webtatic-archive']['gpgkey'] = depends on EL version
default['yum']['webtatic-archive']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installed
default['yum']['webtatic-archive']['gpgcheck'] = true
default['yum']['webtatic-archive']['enabled'] = false
default['yum']['webtatic-archive']['managed'] = false
```

``` ruby
default['yum']['webtatic-archive-debuginfo']['repositoryid'] = depends on EL version
default['yum']['webtatic-archive-debuginfo']['description'] = depends on EL version
default['yum']['webtatic-archive-debuginfo']['mirrorlist'] = depends on EL version
default['yum']['webtatic-archive-debuginfo']['gpgkey'] = depends on EL version
default['yum']['webtatic-archive-debuginfo']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installeddefault['yum']['webtatic-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-archive-debuginfo']['enabled'] = false
default['yum']['webtatic-archive-debuginfo']['managed'] = false
```

``` ruby
default['yum']['webtatic-archive-source']['repositoryid'] = depends on EL version
default['yum']['webtatic-archive-source']['description'] = depends on EL version
default['yum']['webtatic-archive-source']['mirrorlist'] = depends on EL version
default['yum']['webtatic-archive-source']['gpgkey'] = depends on EL version
default['yum']['webtatic-archive-source']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installeddefault['yum']['webtatic-source']['gpgcheck'] = true
default['yum']['webtatic-archive-source']['enabled'] = false
default['yum']['webtatic-archive-source']['managed'] = false
```

``` ruby
default['yum']['webtatic-testing']['repositoryid'] = depends on EL version
default['yum']['webtatic-testing']['description'] = depends on EL version
default['yum']['webtatic-testing']['mirrorlist'] = depends on EL version
default['yum']['webtatic-testing']['gpgkey'] = depends on EL version
default['yum']['webtatic-testing']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installeddefault['yum']['webtatic-testing']['gpgcheck'] = true
default['yum']['webtatic-testing']['enabled'] = false
default['yum']['webtatic-testing']['managed'] = false
```

``` ruby
default['yum']['webtatic-testing-debuginfo']['repositoryid'] = depends on EL version
default['yum']['webtatic-testing-debuginfo']['description'] = depends on EL version
default['yum']['webtatic-testing-debuginfo']['mirrorlist'] = depends on EL version
default['yum']['webtatic-testing-debuginfo']['gpgkey'] = depends on EL version
default['yum']['webtatic-testing-debuginfo']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installed
default['yum']['webtatic-testing-debuginfo']['gpgcheck'] = true
default['yum']['webtatic-testing-debuginfo']['enabled'] = false
default['yum']['webtatic-testing-debuginfo']['managed'] = false
```

``` ruby
default['yum']['webtatic-testing-source']['repositoryid'] = depends on EL version
default['yum']['webtatic-testing-source']['description'] = depends on EL version
default['yum']['webtatic-testing-source']['mirrorlist'] = depends on EL version
default['yum']['webtatic-testing-source']['gpgkey'] = depends on EL version
default['yum']['webtatic-testing-source']['failovermethod'] = nil - depends whether yum fastest mirrors plugin is installed
default['yum']['webtatic-testing-source']['gpgcheck'] = true
default['yum']['webtatic-testing-source']['enabled'] = false
default['yum']['webtatic-testing-source']['managed'] = false
```

Recipes
-------
* default - Walks through node attributes and feeds a yum_resource
  parameters. The following is an example a resource generated by the
  recipe during compilation.

```ruby
  yum_repository 'webtatic' do
    mirrorlist 'https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist_https'
    description 'Webtatic Repository EL7 - $basearch'
    enabled true
    gpgcheck true
    gpgkey 'https://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7'
  end
```

Usage Example
-------------
To disable the webtatic repository through a Role or Environment definition

```
default_attributes(
  :yum => {
    :webtatic => {
      :enabled => {
        false
       }
     }
   }
 )
```

Uncommonly used repositoryids are not managed by default. This is
speeds up integration testing pipelines by avoiding yum-cache builds
that nobody cares about. To enable the webtatic-testing repository with a
wrapper cookbook, place the following in a recipe:

```
node.default['yum']['webtatic-testing']['enabled'] = true
node.default['yum']['webtatic-testing']['managed'] = true
include_recipe 'yum-webtatic'
```

More Examples
-------------
Point the webtatic repositories at an internally hosted server.

```
node.default['yum']['webtatic']['enabled'] = true
node.default['yum']['webtatic']['baseurl'] = 'https://internal.example.com/webtatic/el6/x86_64'
node.default['yum']['webtatic']['sslverify'] = false

include_recipe 'yum-webtatic'
```

License & Authors
-----------------
- Author:: Andy Thompson (<andy@webtatic.com>)

```text
Copyright:: 2014 Andy Thompson
based on yum-epel, Copyright:: 2011-2013 Opscode, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
