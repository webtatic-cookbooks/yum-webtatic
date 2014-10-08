require 'spec_helper'

describe 'yum-webtatic::default' do
  context 'yum-webtatic::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

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

  context 'yum-webtatic::default can manage all repos' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
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

    %w(
      webtatic
      webtatic-archive
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          enabled: true
        )
      end
    end

    %w(
      webtatic-debuginfo webtatic-source
      webtatic-testing webtatic-testing-debuginfo webtatic-testing-source
      webtatic-archive-debuginfo webtatic-archive-source
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          enabled: false
        )
      end
    end

  end

  context 'yum-webtatic::default uses set baseurl without mirrorlist' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['yum']['webtatic']['baseurl'] = 'https://internal.example.com/webtatic/el6/x86_64/'
        node.set['yum']['webtatic']['sslverify'] = false
      end.converge(described_recipe)
    end

    %w(
      webtatic
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          baseurl: 'https://internal.example.com/webtatic/el6/x86_64/',
          mirrorlist: nil,
          sslverify: false
        )
      end
    end

  end

  context 'yum-webtatic::default uses https for RHEL7' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'redhat', version: '7.0').converge(described_recipe) }

    %w(
      webtatic
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: 'https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist',
          sslverify: true
        )
      end
    end

  end

  context 'yum-webtatic::default uses https for RHEL6' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'redhat', version: '6.5').converge(described_recipe) }

    %w(
      webtatic
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: 'http://mirror.webtatic.com/yum/el6/$basearch/mirrorlist'
        )
      end
    end

  end

  context 'yum-webtatic::default allows https to be turned on for RHEL6' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'redhat', version: '6.5') do |node|
        node.set['yum-webtatic']['url_scheme'] = 'https'
      end.converge(described_recipe)
    end

    %w(
      webtatic
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: 'https://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
          sslverify: true
        )
      end
    end

  end
end
