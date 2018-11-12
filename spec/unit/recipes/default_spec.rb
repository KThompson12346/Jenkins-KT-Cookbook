#
# Cookbook:: Jenkins-KT-Cookbook
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'Jenkins-KT-Cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should do an update of sources list' do
      expect(chef_run).to update_apt_update("update")
    end

    it 'Should install Java 8' do
      expect(chef_run).to install_package("openjdk-8-jdk")
    end

    it 'Should install Jenkins' do
      expect(chef_run).to install_package("jenkins")
    end

    it 'Jenkins service should be started' do
      expect(chef_run).to start_service("jenkins")
      expect(chef_run).to enable_service("jenkins")
    end

    it 'Java 8 repo should be added' do
      expect(chef_run).to add_apt_repository("JavaDK8")
    end

    it 'Jenkins repo should be added' do
      expect(chef_run).to add_apt_repository("Jenkins_repo")
    end
  end
end
