require 'serverspec'
set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe yumrepo('webtatic') do
  config_file = file('/etc/yum.repos.d/webtatic.repo')

  it { should exist }

  it { should be_enabled }

  it 'should set mirrorlist to http' do
    expect(config_file).to contain(%r{^mirrorlist=https\?://mirror.webtatic.com/})
  end

  it 'should set gpgcheck to true' do
    expect(config_file).to contain(/^gpgcheck=1/)
  end
end

describe yumrepo('webtatic-source') do
  it { should_not exist }
end

describe yumrepo('webtatic-debuginfo') do
  it { should_not exist }
end
