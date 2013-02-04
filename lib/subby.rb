require 'subby/base'

module Subby
  def self.setup input=ARGV, &blk
    config = Config.new
    config.instance_eval(&blk)
    config.create! input
  end
end
