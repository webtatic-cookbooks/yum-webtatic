#
# Author:: Andy Thompson (<andy@webtatic.com>)
# Recipe:: yum-epel::default
#
# Copyright 2014, Andy Thompson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

%w(
  webtatic webtatic-debuginfo webtatic-source
  webtatic-archive webtatic-archive-debuginfo webtatic-archive-source
  webtatic-testing webtatic-testing-debuginfo webtatic-testing-source
).each do |repo|
  next unless node['yum'][repo]['managed']

  include_recipe 'yum-epel' unless run_context.loaded_recipe?('yum-epel')

  yum_repository repo do
    node['yum'][repo].each do |key, value|
      next if key == 'managed'
      send key, value
    end
    action :create
  end
end
