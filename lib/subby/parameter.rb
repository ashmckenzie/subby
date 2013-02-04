require 'subby/option'

module Subby
  class Parameter < Option

    def valid?
      options.fetch(:format, false) && (!value.nil? && value.match(options[:format])) ? true : false
    end
  end
end
