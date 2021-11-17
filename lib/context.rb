require_relative 'state'
require_relative 'init_state'
require_relative 'calculation_state'
require_relative 'print_state'

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
