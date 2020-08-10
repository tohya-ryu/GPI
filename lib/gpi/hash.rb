module GPI

module HashExtend

  def to_module(name)
    p name.capitalize
    h = self
    m = eval("::#{name.capitalize} = Module.new")
    m.class_eval {
      instance_variable_set(:@hash, h)
      h.each_key do |k|
        define_singleton_method k do
          @hash[k]
        end
      end
    }
  end

end # END OF MIXIN

end # END OF NAMESPACE
