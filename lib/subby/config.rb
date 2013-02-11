require 'subby/option_base'
require 'subby/runtime_config'

module Subby
  class Config

    include OptionBase

    attr_reader :runtime_config, :commands

    def initialize
      super()
      @runtime_config = RuntimeConfig.new
      @commands = {}
    end

    def create! input
      parse input
      validate_required
      runtime_config
    end

    private

    def command name, &blk
      @commands[name.to_s] = Command.new(name, &blk)
    end

    def validate_required
      options.merge(runtime_command_options).each do |name, option|
        klass = Error::InvalidParameter
        raise klass.new(option), 'Required parameter missing' if option.required? && !option.valid?
      end
    end

    def runtime_command_options
      runtime_config.command ? runtime_config.command.options : {}
    end

    def parse input
      i = 0
      current_command = nil

      until i >= input.length
        arg = input[i].dup

        if looks_like_option? arg

          strip_dashes! arg

          if is_valid_switch?(arg) || (current_command && current_command.is_valid_switch?(arg))
            process_switch arg, current_command
          elsif is_valid_parameter?(arg) || (current_command && current_command.is_valid_parameter?(arg))
            process_parameter arg, input[i += 1], current_command
          end

        elsif is_valid_command? arg
          current_command = commands[arg]
          command = commands[arg].dup
          command.options = {}
          runtime_config.command = command
        end

        i += 1
      end
    end

    def looks_like_option? arg
      arg[0...2] == '--'
    end

    def strip_dashes! arg
      arg.gsub!(/^\-+/, '')
    end

    def is_valid_command? name
      commands.include? name
    end

    def process_switch arg, current_command
      if current_command
        option = current_command.options[arg]
        runtime_config.command.options[option.name] = option
      else
        option = options[arg]
        runtime_config.options[option.name] = option
      end
    end

    def process_parameter arg, value, current_command

      if current_command
        option = current_command.options[arg]
      else
        option = options[arg]
      end

      option.value = value

      raise Error::InvalidParameter.new(option), 'Invalid parameter value' unless option.valid?

      if current_command
        runtime_config.command.options[option.name] = option
      else
        runtime_config.options[option.name] = option
      end
    end
  end
end
