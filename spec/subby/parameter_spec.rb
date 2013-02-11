require 'spec_helper'
require 'subby/parameter'

describe Subby::Parameter do

  subject { Subby::Parameter }

  let(:description) { 'Description' }
  let(:options) { {} }

  subject { Subby::Parameter.new('parameter_name', description, options) }

  describe '#parameter?' do

    it 'returns true' do
      subject.parameter?.should be_true
    end
  end

  describe '#switch?' do

    it 'returns false' do
      subject.switch?.should be_false
    end
  end

  describe '#required?' do

    context 'with required option set to true' do
      let(:options) { { required: true } }

      it 'returns true' do
        subject.required?.should be_true
      end
    end

    context 'with required option set to false' do
      let(:options) { { required: false } }

      it 'returns false' do
        subject.required?.should be_false
      end
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
