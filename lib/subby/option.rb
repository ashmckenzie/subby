module Subby
  class Option

    attr_reader :name, :description, :options, :value
    attr_writer :value

    def initialize name, description='', options={}
      @name = name
      @description = description
      @options = options
    end

    def required?
      options.fetch(:required, false)
    end

    def switch?
      self.class == Subby::Switch
    end

    def parameter?
      self.class == Subby::Parameter
    end
  end
end
