require 'spec_helper'
require 'subby/command'

describe Subby::Command do

  subject { Subby::Command }

  describe '#initialize' do

    it 'sets name' do
      subject.new('command_name').name.should == 'command_name'
    end

    it 'sets name and description' do
      command = subject.new('command_name') do
        description 'the description'
      end

      command.instance_variable_get('@description').should == 'the description'
    end
  end

  context 'initialized' do

    subject { Subby::Command.new('command_name') }

    describe '#description' do

      it 'sets description' do
        subject.description 'the description'
        subject.instance_variable_get('@description').should == 'the description'
      end
    end
  end

end
