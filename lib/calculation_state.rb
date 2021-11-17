class CalculationState < State
  def handle1
    temperature.calculate
    @context.transition_to(PrintState.new, temperature)
  end
end
