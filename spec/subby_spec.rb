require 'spec_helper'
require 'subby'

describe Subby do

  describe '.setup' do

    # before do
    #   subby = Subby.setup do
    #     switch :switch, 'Optional switch'
    #     parameter :optional_number, 'Optional number parameter', format: /\d+/
    #     parameter :required_string, 'Required string', format: /\w+/, required: true
    #   end
    # end

    context 'with empty input and no block' do

      it 'raises an exception' do
        expect { Subby.setup }.to raise_error(ArgumentError)
      end
    end

    context 'with no input defined' do

      subject do
        Subby.setup input do
          switch :switch, 'Optional switch'
        end
      end

      let(:input) { %w{} }

      it 'has no options' do
        subject.command.should be_nil
      end
    end

    context 'with one switch configured' do

      subject do
        Subby.setup input do
          switch :switch, 'Optional switch'
        end
      end

      context 'with input defined as --switch' do
        let(:input) { %w{ --switch } }

        it 'has one option of type Subby::Switch' do
          subject.options.count.should == 1
          subject.options[:switch].should be_instance_of(Subby::Switch)
        end
      end

    end

    context 'with one optional parameter configured' do


      context 'without format defined' do

        subject do
          Subby.setup input do
            parameter :parameter, 'Optional parameter'
          end
        end

        context 'with no input defined' do
          let(:input) { %w{} }

          it 'has no options' do
            subject.command.should be_nil
          end
        end

        context 'with input defined as --parameter abc' do
          let(:input) { %w{ --parameter abc } }

          it 'raises an Error::InvalidParameter exception' do
            expect { subject }.to raise_error(Subby::Error::InvalidParameter)
          end
        end

      end

      context 'with format defined' do

        subject do
          Subby.setup input do
            parameter :parameter, 'Optional parameter', format: /\w+/
          end
        end

        context 'with input defined as --parameter abc' do
          let(:input) { %w{ --parameter abc } }

          it 'has one option of type Subby::Switch' do
            subject.options.count.should == 1
            subject.options[:parameter].should be_instance_of(Subby::Parameter)
          end
        end
      end
    end
  end
end
