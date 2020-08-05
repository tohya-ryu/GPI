class Command
  attr_accessor :name, :pcount, :options

  def initialize(name, pcount, options)
    @name = name
    @pcount = pcount
    @options = options
  end
end

class Option
  attr_accessor :name, :param
  
  def initialize(name)
    @name = name
    @param = Array.new
  end

  def add_param(str)
    @param.push(str)
  end
end
