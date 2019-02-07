#
# Cookbook Name:: docker_compose
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'docker_compose::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      # This doesn't help if the default attributes are changed. Maybe this should override the defaults
      #   with new "defaults" just for the test. Then the stubbed command path and version would match.
      #   That's just a different level of hard-coding, though.
      stub_command("/usr/local/bin/docker-compose --version | grep 1.21.2").and_return(true)

      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
