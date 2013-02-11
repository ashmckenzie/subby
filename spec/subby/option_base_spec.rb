require 'spec_helper'
require 'subby/option_base'

class DummyClass
  include Subby::OptionBase
end

describe Subby::OptionBase do

  subject { DummyClass.new }

  let(:name) { 'name' }
  let(:description) { 'Description' }
  let(:options) { {} }

  describe 'accessors' do

    describe '#options' do
      it 'returns an empty hash' do
        subject.options.should == {}
      end
    end
  end

  describe 'switches' do

    before do
      subject.switch name, description
    end

    describe '#switch' do

      it 'adds a new Switch to the list of options' do
        subject.options[name].should be_instance_of(Subby::Switch)
      end
    end

    describe '#is_valid_switch?' do

      it 'returns true' do
        subject.is_valid_switch?(name).should be_true
      end
    end
  end

  describe 'parameters' do

    before do
      subject.parameter name, description, options
    end

    describe '#parameter' do

      it 'adds a new Parameter to the list of options' do
        subject.options[name].should be_instance_of(Subby::Parameter)
      end
    end

    describe '#is_valid_parameter?' do

      it 'returns true' do
        subject.is_valid_parameter?(name).should be_true
      end
    end
  end
end
