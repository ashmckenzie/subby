module Subby
  module OptionBase

    def switch name, description='', options={}
      @options[name] = Switch.new(name, description, options)
    end

    def parameter name, description='', options={}
      @options[name] = Parameter.new(name, description, options)
    end

    def command name, &blk
      @commands[name] = Command.new(name, &blk)
    end

    protected

    def is_valid_switch? name
      name[0...2] == '--' && options.keys.include?(name[2..-1].to_sym) && options[name[2..-1].to_sym].switch?
    end

    def is_valid_parameter? name
      name[0...2] == '--' && options.keys.include?(name[2..-1].to_sym) && options[name[2..-1].to_sym].parameter?
    end
  end
end
