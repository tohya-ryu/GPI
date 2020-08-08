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

  def self.extend(sym)
    case sym
    when :dir
      Dir.class_eval { include DirExtend }
    when :file
      File.class_eval { include FileExtend }
    when :hash
      File.class_eval { include HashExtend }
    when :string
      String.class_eval { include StringExtend }
    end
  end

require 'gpi/classes.rb'
require 'gpi/clu.rb'
require 'gpi/dir.rb'
require 'gpi/file.rb'
require 'gpi/hash.rb'

end # END OF MODULE
