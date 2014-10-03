require 'serverspec'
set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe yumrepo('webtatic-archive') do
  it { should_not exist }
end

describe yumrepo('webtatic-archive-source') do
  it { should_not exist }
end

describe yumrepo('webtatic-archive-debuginfo') do
  it { should_not exist }
end
