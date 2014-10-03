require 'serverspec'
set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe yumrepo('webtatic-archive') do
  config_file = file('/etc/yum.repos.d/webtatic-archive.repo')

  it { should exist }

  it { should be_enabled }

  it 'should not set mirrorlist' do
    expect(config_file).not_to contain(/^mirrorlist=/)
  end

  it 'should set baseurl to http' do
    expect(config_file).to contain(%r(^baseurl=http://repo.webtatic.com/))
  end

  it 'should set gpgcheck to true' do
    expect(config_file).to contain(/^gpgcheck=1/)
  end
end

describe yumrepo('webtatic-archive-source') do
  it { should_not exist }
end

describe yumrepo('webtatic-archive-debuginfo') do
  it { should_not exist }
end
