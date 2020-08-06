module GPI

class File

  def self.copy(from, to) 
    i = ::File.open(from, "r")
    o = ::File.open(to, "w")
    o.write(i.read)
    i.close
    o.close
  end

end # END OF CLASS

end # END OF MODULE
