module GPI

module CLU # Command Line Utilities

  #####################
  # @command
  # @commands
  # @appcom | flag
  
  def self.init
    @appcom = false
    @commands = Array.new
    @parameters = Array.new
    @options = Array.new
  end

  def self.command
    @command.name
  end

  def self.parameters
    @parameters
  end

  def self.options
    @options
  end

  def self.check_option(str)
    @options.each do |o|
      return true if o.name == str
    end
    false
  end

  def self.process_args
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
            GPI.print "Invalid option for command #{@command.name}"
            GPI.print "Legal options:"
            @command.options.each_char do |c|
              GPI.print "-#{c}"
            end
            GPI.quit
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
      GPIT.print "Invalid number of parameters for command given"
      GPI.quit
    end
  end

  def self.require_command
    # exit when no command given
    if @command.nil?
      # no valid command, exit
      GPI.print "Missing or Invalid Command."
      GPI.print "Legal commands are:"
      @commands.each { |c| GPI.print "- #{c.name}" }
      GPI.quit
    end
  end

  def self.use_command(name, pcount, options) # if program has multiple commands
    @commands.push(Command.new(name, pcount, options))
  end

  def self.app_command(pcount, options) # if app only accepts parameters
    @commands.push(Command.new(GPI.app_name, pcount, options))
    @appcom = true
  end

end # END OF MODULE

end # END OF MODULE
