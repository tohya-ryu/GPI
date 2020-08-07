module GPI

module FileExtend

  def File.copy(from, to) 
    i = File.open(from, "r")
    o = File.open(to, "w")
    o.write(i.read)
    i.close
    o.close
  end

end # END OF MIXIN

end # END OF MODULE
