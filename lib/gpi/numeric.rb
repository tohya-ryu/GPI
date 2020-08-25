module GPI

module NumericExtend

  def mib_to_bytes
    self.to_f * (1024 * 1024).to_f
  end

  def bytes_to_mib
    self.to_f / (1024 * 1024).to_f
  end

  def mb_to_bytes
    self.to_f * (1000 * 1000).to_f
  end

  def mb_to_mib
    a = self.mb_to_bytes
    b = self.mib_to_bytes
    c = b - a
    d = a - c
    d.bytes_to_mib
  end

end # END OF MIXIN

end # END OF NAMESPACE
