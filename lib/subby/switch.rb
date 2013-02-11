module Subby
  class Switch

    attr_accessor :name, :description

    def initialize name, description
      @name = name
      @description = description
    end

    def switch?
      true
    end

    def parameter?
      false
    end

    def required?
      false
    end
  end
end
