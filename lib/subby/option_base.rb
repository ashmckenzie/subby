module Subby
  module OptionBase

    attr_accessor :options

    def initialize
      @options = {}
    end

    def switch name, description
      @options[name.to_s] = Switch.new(name, description)
    end

    def parameter name, description, options={}
      @options[name.to_s] = Parameter.new(name, description, options)
    end

    def is_valid_switch? name
      options.keys.include?(name) && options[name].switch?
    end

    def is_valid_parameter? name
      options.keys.include?(name) && options[name].parameter?
    end
  end
end
