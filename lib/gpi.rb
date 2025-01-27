module GPI

  @app_name = "GPI"

  def self.gem_interface_test
    GPI.print "gem integration successful"
  end

  def self.quit
    GPI.print "aborted"
    exit
  end

  def self.app_name=(str)
    @app_name = str 
  end

  def self.app_name
    @app_name
  end

  def self.print(str, o = nil)
    if o.nil?
      puts "#{@app_name} > " << str
    else
      if o
        puts "#{@app_name} > " << str
      end
    end
  end

  def self.extend(sym)
    case sym
    when :dir
      Dir.class_eval { include DirExtend }
    when :file
      File.class_eval { include FileExtend }
    when :hash
      Hash.class_eval { include HashExtend }
    when :numeric
      Numeric.class_eval { include NumericExtend }
    when :string
      String.class_eval { include StringExtend }
    end
  end

require 'gpi/classes.rb'
require 'gpi/clu.rb'
require 'gpi/dir.rb'
require 'gpi/file.rb'
require 'gpi/hash.rb'
require 'gpi/numeric.rb'
require 'gpi/string.rb'

end # END OF MODULE
