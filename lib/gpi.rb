module GPI

  @app_name = "GPI"

  def self.gem_interface_test
    GPI.print "gem integration successful"
  end

  def self.quit
    exit
  end

  def self.app_name=(str)
    @app_name = str 
  end

  def self.app_name
    @app_name
  end

  def self.print(str)
    puts "#{@app_name} > " << str
  end

require 'gpi/clu.rb'
require 'gpi/dir.rb'
require 'gpi/classes.rb'

end # END OF MODULE