require 'spec_helper'
require 'subby/switch'

describe Subby::Switch do

  subject { Subby::Switch }

  let(:description) { 'Description' }

  subject { Subby::Switch.new('switch_name', description) }

  describe '#switch?' do

    it 'returns true' do
      subject.switch?.should be_true
    end
  end

  describe '#parameter?' do

    it 'returns false' do
      subject.parameter?.should be_false
    end
  end

  describe '#required?' do

    it 'returns false' do
      subject.required?.should be_false
    end
  end

end
