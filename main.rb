require_relative 'lib/temperature'
require_relative 'lib/context'
require_relative 'lib/state'
require_relative 'lib/init_state'

loop do
  input = gets.chomp
  output = gets.chomp
  number = gets.to_f
  temperature = Temperature.new(input, output, number)
  context = Context.new(InitState.new, temperature)
  context.request1
  context.request1
end
