require 'spec_helper'
require 'subby/config'

describe Subby::Config do

  subject { Subby::Config.new }

=begin
  subby = Subby.setup do
    switch :switch, 'Optional switch'
    parameter :optional_number, 'Optional number parameter', format: /\d+/
    parameter :required_string, 'Required string', format: /\w+/, required: true
  end

  def self.setup input=ARGV, &blk
    config = Config.new
    config.instance_eval(&blk)
    config.create! input
  end
=end

  describe 'accessors' do
    describe '#commands' do
      it 'returns an empty hash' do
        subject.commands.should == {}
      end
    end
  end

  describe '#create!' do

    subject { Subby::Config.new.create!(input) }

    context 'with empty input' do
      let(:input) { '' }

      it { should be_instance_of Subby::RuntimeConfig }
      its(:command) { should be_nil }
      its(:options) { should be_empty }
    end

  end
end
