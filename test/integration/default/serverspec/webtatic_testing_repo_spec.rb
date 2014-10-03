require 'serverspec'
set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe yumrepo('webtatic-testing') do
  it { should_not exist }
end

describe yumrepo('webtatic-testing-source') do
  it { should_not exist }
end

describe yumrepo('webtatic-testing-debuginfo') do
  it { should_not exist }
end
