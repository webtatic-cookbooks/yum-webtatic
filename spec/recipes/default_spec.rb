require 'spec_helper'

describe 'yum-webtatic::default' do
  context 'with default attributes' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    %w(
      webtatic
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          enabled: true,
          failovermethod: 'priority',
          gpgcheck: true,
          sslverify: true
        )
      end
    end

    %w(
      webtatic-debuginfo webtatic-source
      webtatic-testing webtatic-testing-debuginfo webtatic-testing-source
      webtatic-archive webtatic-archive-debuginfo webtatic-archive-source
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).not_to create_yum_repository(repo)
      end
    end
  end

  context 'with all repos set as managed' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['yum']['webtatic']['managed'] = true
        node.set['yum']['webtatic-debuginfo']['managed'] = true
        node.set['yum']['webtatic-source']['managed'] = true
        node.set['yum']['webtatic-testing']['managed'] = true
        node.set['yum']['webtatic-testing-debuginfo']['managed'] = true
        node.set['yum']['webtatic-testing-source']['managed'] = true
        node.set['yum']['webtatic-archive']['managed'] = true
        node.set['yum']['webtatic-archive']['enabled'] = true
        node.set['yum']['webtatic-archive-debuginfo']['managed'] = true
        node.set['yum']['webtatic-archive-source']['managed'] = true
      end.converge(described_recipe)
    end

    it 'enables repos marked by default as enabled' do
      %w(
        webtatic
        webtatic-archive
      ).each do |repo|
        expect(chef_run).to create_yum_repository(repo).with(
          enabled: true
        )
      end
    end

    it 'disables repos marked by default as disabled' do
      %w(
        webtatic-debuginfo webtatic-source
        webtatic-testing webtatic-testing-debuginfo webtatic-testing-source
        webtatic-archive-debuginfo webtatic-archive-source
      ).each do |repo|
        expect(chef_run).to create_yum_repository(repo).with(
          enabled: false
        )
      end
    end
  end

  context 'with a custom baseurl on webtatic repostory' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['yum']['webtatic']['baseurl'] = 'https://internal.example.com/webtatic/el6/x86_64/'
        node.set['yum']['webtatic']['sslverify'] = false
      end.converge(described_recipe)
    end

    it 'creates webtatic repostory without the mirrorlist' do
      %w(
        webtatic
      ).each do |repo|
        expect(chef_run).to create_yum_repository(repo).with(
          baseurl: 'https://internal.example.com/webtatic/el6/x86_64/',
          mirrorlist: nil,
          sslverify: false
        )
      end
    end
  end

  context 'with default url scheme' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.1').converge(described_recipe) }

    it 'creates webtatic repository with https mirrorlist' do
      %w(
        webtatic
      ).each do |repo|
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: 'https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist',
          sslverify: true
        )
      end
    end
  end

  context 'with url scheme set to http' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.1') do |node|
        node.set['yum-webtatic']['url_scheme'] = 'http'
      end.converge(described_recipe)
    end

    it 'creates webtatic repository with http mirrorlist' do
      %w(
        webtatic
      ).each do |repo|
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: 'http://mirror.webtatic.com/yum/el7/$basearch/mirrorlist',
          sslverify: true
        )
      end
    end
  end
end
