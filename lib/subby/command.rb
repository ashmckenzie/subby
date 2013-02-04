require 'subby/option_base'

module Subby
  class Command

    include OptionBase

    attr_reader :name, :description, :options

    def initialize name, &blk
      @name = name
      @options = {}
      instance_eval(&blk)
    end

    def description description
      @description = description
    end
  end
end
