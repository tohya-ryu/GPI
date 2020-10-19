module GPI

module DirExtend

  def Dir.directories(dir) 
    Dir.entries(dir).select do |f|
      File.directory?(File.join(dir,f)) && f != "." && f != ".."
    end
  end

  def Dir.files(dir)
    Dir.entries(dir).select do |f|
      !(File.directory?(File.join(dir,f)))
    end
  end

  def Dir.filesr(dir, ar = Array.new)
    Dir.entries(dir).each do |f|
      if File.directory?(File.join(dir, f))
        if f == "." || f == ".."
          next
        else
          Dir.filesr(File.join(dir, f), ar)
        end
      else
        ar.push File.join(dir, f)
      end
    end
    ar
  end

end # END OF MIXIN

end # END OF MODULE
