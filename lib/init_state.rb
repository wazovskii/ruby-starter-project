class InitState < State
  def handle1
    @context.transition_to(CalculationState.new, temperature)
    context.request1
  end
end
