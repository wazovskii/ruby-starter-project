class State
  attr_accessor :context, :temperature

  def handle1
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
