module GPI

module StringExtend

  def ends_with?(str)
    l = str.length
    ol = self.length
    return false if ol <= l
    !(self.index(str, ol-l).nil?)
  end

end # END OF MIXIN

end # END OF NAMESPACE
