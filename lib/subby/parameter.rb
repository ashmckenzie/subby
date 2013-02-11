require 'subby/option'

module Subby
  class Parameter < Option
    def parameter?
      true
    end

    def valid?
      return true if value.nil? && !options.fetch(:format, false)
      options.fetch(:format) && value.to_s.match(options[:format]) ? true : false
    end
  end
end
