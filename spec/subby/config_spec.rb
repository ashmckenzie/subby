require 'spec_helper'
require 'subby/config'

describe Subby::Config do

  subject { Subby::Config.new }

=begin
  def self.setup input=ARGV, &blk
    config = Config.new
    config.instance_eval(&blk)
    config.create! input
  end
=end

  describe '#create!' do

  end
end