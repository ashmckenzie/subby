module Subby
  module OptionBase

    attr_accessor :options, :commands

    def initialize
      @options = {}
      @commands = {}
    end

    def switch name, description, options={}
      @options[name] = Switch.new(name, description, options)
    end

    def parameter name, description, options={}
      @options[name] = Parameter.new(name, description, options)
    end

    def command name, &blk
      @commands[name] = Command.new(name, &blk)
    end

    def is_valid_switch? name
      options.keys.include?(name) && options[name].switch?
    end

    def is_valid_parameter? name
      options.keys.include?(name) && options[name].parameter?
    end
  end
end
