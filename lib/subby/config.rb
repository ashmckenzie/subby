require 'subby/option_base'

class Config

  include OptionBase

  attr_reader :options, :commands

  def initialize
    @options = {}
    @commands = {}
  end

  def create! input
    parse input
    validate_required
    runtime_config
  end

  private

  def runtime_config
    @runtime_config ||= RuntimeConfig.new
  end

  def validate_required
    options.merge(runtime_config.command.options).each do |name, option|
      klass = Error::InvalidParameter
      raise klass.new(option), 'Required option missing' unless option.required? && option.valid?
    end
  end

  def parse input
    i = 0
    current_command = nil

    until i >= input.length
      arg = input[i]

      if is_valid_command? arg
        runtime_config.command = current_command = commands[arg.to_sym]

      elsif is_valid_switch?(arg) || (current_command && current_command.is_valid_switch?(arg))
        process_switch arg

      elsif is_valid_parameter?(arg) || (current_command && current_command.is_valid_parameter?(arg))
        process_parameter arg, input[i += 1], current_command

      end

      i += 1
    end
  end

  def is_valid_command? name
    commands.include? name.to_sym
  end

  private

  def process_switch arg
    option = options[arg[2..-1].to_sym]
    runtime_config.options[option.name] = option
  end

  def process_parameter arg, value, current_command
    if is_valid_parameter?(arg)
      option = options[arg[2..-1].to_sym]
    else
      option = current_command.options[arg[2..-1].to_sym]
    end

    option.value = value

    raise Error::InvalidParameter.new(option), 'Invalid parameter value' unless option.valid?

    if is_valid_parameter?(arg)
      runtime_config.options[option.name] = option
    else
      runtime_config.command.options[option.name] = option
    end
  end
end
