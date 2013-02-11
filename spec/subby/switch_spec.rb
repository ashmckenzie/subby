require 'spec_helper'
require 'subby/switch'

describe Subby::Switch do

  subject { Subby::Switch }

  context 'initialized' do

    let(:description) { 'Description' }
    let(:options) { {} }

    subject { Subby::Switch.new('switch_name', description, options) }

    describe '#switch?' do

      it 'returns true' do
        subject.switch?.should be_true
      end
    end
  end

end
