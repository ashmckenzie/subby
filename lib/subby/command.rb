require 'subby/option_base'

module Subby
  class Command

    include OptionBase

    attr_reader :name

    def initialize name, &blk
      @name = name
      instance_eval(&blk) if block_given?
    end

    def description description
      @description = description
    end
  end
end
