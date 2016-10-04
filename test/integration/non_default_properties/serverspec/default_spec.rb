require 'spec_helper'

describe 'non_default_properties' do
  context 'git repository' do
    subject { git('/tmp/gq') }
    it { expect(subject).to exist }
    it { expect(subject).to be_initialized }
    it { expect(subject.config).to include 'remote.origin.url' => 'https://github.com/ceilfors/gq.git' }
    it { expect(subject.config).to include 'daun.tag.limit' => '3' }
    it { expect(subject.config).to include 'daun.tag.blacklist' => 'mytag' }
    it { expect(subject.config).to include 'daun.branch.blacklist' => 'mybranch' }
  end

  it 'checks out master branch' do
    expect(file '/tmp/gq/branches/master').to be_directory
  end
end
