#
# Cookbook Name:: daun
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

module Kernel
  alias :old_require :require
  def require(path)
    old_require(path) unless ['daun', 'rugged'].include?(path)
  end
end


describe 'daun::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
