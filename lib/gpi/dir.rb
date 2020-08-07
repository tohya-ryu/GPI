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

end # END OF MIXIN

end # END OF MODULE
