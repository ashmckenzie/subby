module Subby
  module Error

    class BasicError < StandardError
      attr_reader :option

      def initialize option
        @option = option
      end
    end

    class InvalidParameter < BasicError
    end

    class InvalidSwitch < BasicError
    end
  end
end
