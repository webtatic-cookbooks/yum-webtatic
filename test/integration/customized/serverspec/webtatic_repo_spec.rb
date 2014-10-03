require 'serverspec'
set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe yumrepo('webtatic') do
  config_file = file('/etc/yum.repos.d/webtatic.repo')

  it { should exist }

  it { should be_enabled }

  it 'should set mirrorlist to http' do
    expect(config_file).to contain(%r(^mirrorlist=http://mirror.webtatic.com/))
  end
end

describe yumrepo('webtatic-source') do
  it { should_not exist }
end

describe yumrepo('webtatic-debuginfo') do
  it { should exist }

  it { should_not be_enabled }
end
