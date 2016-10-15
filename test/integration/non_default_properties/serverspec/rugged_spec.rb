require 'spec_helper'

describe 'rugged' do
  context 'features' do
    it { expect(Rugged.features).to include :https }
    it { expect(Rugged.features).to include :ssh }
  end
end
