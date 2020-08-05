class Dir

  def Dir.get_dir(dir) 
    Dir.entries(dir).select do |f|
      File.directory?(File.join(dir,f)) && f != "." && f != ".."
    end
  end

end
