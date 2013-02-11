module Subby
  class Option

    attr_reader :name, :description, :options
    attr_accessor :value

    def initialize name, description, options={}
      @name = name
      @description = description
      @options = options
    end

    def required?
      options.fetch(:required, false)
    end

    def switch?
      false
    end

    def parameter?
      false
    end
  end
end
