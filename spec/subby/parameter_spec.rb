require 'spec_helper'
require 'subby/parameter'

describe Subby::Parameter do

  subject { Subby::Parameter }

  context 'initialized' do

    let(:description) { 'Description' }
    let(:options) { {} }

    subject { Subby::Parameter.new('parameter_name', description, options) }

    describe '#parameter?' do

      it 'returns true' do
        subject.parameter?.should be_true
      end
    end

    describe '#valid?' do

      context 'with no value or format specified' do
        it 'returns true' do
          subject.valid?.should be_true
        end
      end

      context 'with an invalid value specified' do

        let(:options) { { format: /\d+/ } }

        it 'returns false' do
          subject.value = 'invalid_value'
          subject.valid?.should be_false
        end
      end

      context 'with a valid value specified' do

        let(:options) { { format: /\d+/ } }

        it 'returns false' do
          subject.value = 123
          subject.valid?.should be_true
        end
      end
    end
  end

end
