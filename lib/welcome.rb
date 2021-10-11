class Temperature
  attr_reader :result

  def initialize(in_lettter, out_letter, num)
    @in_lettter = in_lettter
    @out_letter = out_letter
    @num = num
  end

  def from_f
    case @out_letter
    when 'F'
      @num.to_s
    when 'C'
      (5.0 / 9.0 * (@num - 32)).to_s
    when 'K'
      ((@num + 459.67) * 5.0 / 9.0).to_s
    else 'wrong output letter'
    end
  end

  def from_c
    case @out_letter
    when 'F'
      (@num *  9.0 / 5.0 + 32).to_s
    when 'C'
      @num.to_s
    when 'K'
      (@num + 273.15).to_s
    else 'wrong output letter'
    end
  end

  def from_k
    case @out_letter
    when 'F'
      (@num * 9.0 / 5.0 - 459.67).to_s
    when 'C'
      (@num - 273.15).to_s
    when 'K'
      @num.to_s
    else 'wrong output letter'
    end
  end

  def calculate
    @result = case @in_lettter
              when 'F'
                from_f
              when 'C'
                from_c
              when 'K'
                from_k
              else 'wrong input letter'
              end
    @result.to_s
  end

  def print
    puts @result
  end
end

class Context
  attr_accessor :state, :temperature
  private :state

  def initialize(state, temperature)
    transition_to(state, temperature)
  end

  def transition_to(state, temperature)
    @state = state
    @state.temperature = temperature
    @state.context = self
  end

  def request1
    @state.handle1
  end
end

class State
  attr_accessor :context, :temperature

  def handle1
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class InitState < State
  def handle1
    @context.transition_to(CalculationState.new, temperature)
  end
end

class CalculationState < State
  def handle1
    temperature.calculate
    @context.transition_to(PrintState.new, temperature)
  end
end

class PrintState < State
  def handle1
    temperature.print
    @context.transition_to(InitState.new, temperature)
  end
end
