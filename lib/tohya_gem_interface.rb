require 'tohya_gem_interface/dir.rb'
require 'tohya_gem_interface/classes.rb'

class TohyaGemInterface
  attr_reader :parameters, :options

  #####################
  # @app_name
  # @command
  # @commands
  # @appcom | flag
  
  def initialize
    @appcom = false
    @commands = Array.new
    @parameters = Array.new
    @options = Array.new
  end

  private

  def command
    @command.name
  end

  def process_args
    @command = nil
    # attempt to find command
    if @appcom
      @command = @commands[0]
    else
      if ARGV.length >= 1
        @commands.each do |c|
          @command = c if ARGV[0] == c.name
        end
      end
    end
    i = 0
    z = -1 # used to assign paramter to command or correct option
    ARGV.each do |arg|
      i += 1
      next if (i == 1 && !@appcom) # skip if command
      if arg[0] == '-' # option(s)
        arg.each_char do |c|
          next if c == '-'
          if @command.options.include?(c)
            @options.push(Option.new(c))
            z = @options.size - 1
          else
            puts "Invalid option for command #{@command.name}"
            puts "Legal options:"
            @command.options.each_char do |c|
              puts "-#{c}"
            end
            quit
          end
        end
      else # parameter
        if z == -1 # command parameter
          @parameters.push(arg)
        else
          @options[z].add_param(arg)
        end
      end
    end
    require_command
    unless @command.pcount.include?(@parameters.size)
      puts "Invalid number of parameters for command given"
      quit
    end
  end

  def require_command
    # exit when no command given
    if @command.nil?
      # no valid command, exit
      puts "Missing or Invalid Command."
      puts "Legal commands are:"
      @commands.each { |c| puts "- #{c.name}" }
      quit
    end
  end

  def use_command(name, pcount, options) # if program has multiple commands
    @commands.push(Command.new(name, pcount, options))
  end

  def app_command(pcount, options) # if app only accepts parameters
    @commands.push(Command.new(@app_name, pcount, options))
    @appcom = true
  end

  def gem_interface_test
    puts "gem integration successful"
  end

  def quit
    exit
  end

  def app_name(str)
    @app_name = str 
  end

end
