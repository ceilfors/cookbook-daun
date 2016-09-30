require 'spec_helper'

describe 'non_default_properties' do
  describe file('/tmp/gq') do
    it { should be_directory }
  end

  describe file('/tmp/gq/branches/master') do
    it { should be_directory }
  end
end
