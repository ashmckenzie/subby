module Subby
  class Parameter

    attr_reader :name, :description, :options
    attr_accessor :value

    def initialize name, description, options={}
      @name = name
      @description = description
      @options = options
    end

    def parameter?
      true
    end

    def switch?
      false
    end

    def required?
      options.fetch(:required, false)
    end

    def valid?
      return true if value.nil? && !options.fetch(:format, false)

      options.fetch(:format) do
        raise Error::InvalidParameter.new(self), 'Format not defined'
      end

      value.to_s.match(options[:format]) ? true : false
    end
  end
end
