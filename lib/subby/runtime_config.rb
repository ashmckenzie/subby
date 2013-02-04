module Subby
  class RuntimeConfig

    attr_accessor :options, :command

    def initialize
      @options = {}
      @command = nil
    end
  end
end
