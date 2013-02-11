require 'spec_helper'
require 'subby/option'

describe Subby::Option do

  subject { Subby::Option }

  let(:name) { 'option_name' }
  let(:description) { 'Description' }
  let(:options) { {} }

  subject { Subby::Option.new(name, description, options) }

  describe 'readers' do

    describe 'name' do
      its(:name) { should == name }
    end

    describe 'description' do
      its(:description) { should == description }
    end

    describe 'options' do
      its(:options) { should == options }
    end
  end

  describe 'accessors' do

    describe 'value' do
      before { subject.value = 'some_value' }
      its(:value) { should == 'some_value' }
    end
  end

  describe '#required?' do

    context 'with no options defined' do
      it 'returns false by default' do
        subject.required?.should be_false
      end
    end

    context 'with required set to false' do

      let(:options) { { required: false } }

      it 'returns false' do
        subject.required?.should be_false
      end
    end

    context 'with required set to true' do

      let(:options) { { required: true } }

      it 'returns true' do
        subject.required?.should be_true
      end
    end
  end

  describe '#switch?' do

    it 'returns false' do
      subject.switch?.should be_false
    end
  end

  describe '#parameter?' do
    it 'returns false' do
      subject.parameter?.should be_false
    end
  end

end
