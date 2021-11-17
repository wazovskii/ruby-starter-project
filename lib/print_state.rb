class PrintState < State
  def handle1
    temperature.print
    @context.transition_to(InitState.new, temperature)
  end
end
