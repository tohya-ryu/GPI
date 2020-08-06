class Dir

  def self.directories(dir) 
    Dir.entries(dir).select do |f|
      File.directory?(File.join(dir,f)) && f != "." && f != ".."
    end
  end

  def self.files(dir)
    Dir.entries(dir).select do |f|
      !(File.directory?(File.join(dir,f)))
    end
  end

end
