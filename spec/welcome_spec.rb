require './lib/temperature'
require './lib/state'
require './lib/calculation_state'
require './lib/print_state'
require './lib/init_state'
require './lib/context'

RSpec.describe Temperature do
  describe '#From D to C calculation value 0' do
    subject do
      temperature = Temperature.new('D', 'C', 0)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq 'wrong input letter' }
  end
  describe '#From C to M calculation value 0' do
    subject do
      temperature = Temperature.new('C', 'M', 0)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq 'wrong output letter' }
  end
  describe '#From C to F calculation value 3' do
    subject do
      temperature = Temperature.new('C', 'F', 3)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '37.4' }
  end
  describe '#From C to K calculation value 30' do
    subject do
      temperature = Temperature.new('C', 'K', 30)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '303.15' }
  end
  describe '#From C to C calculation value 5' do
    subject do
      temperature = Temperature.new('C', 'C', 5)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '5' }
  end
  describe '#From K to F calculation value 5' do
    subject do
      temperature = Temperature.new('K', 'F', 5)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '-450.67' }
  end
  describe '#From K to C calculation value 50' do
    subject do
      temperature = Temperature.new('K', 'C', 50)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '-223.14999999999998' }
  end
  describe '#From K to K calculation value 555' do
    subject do
      temperature = Temperature.new('K', 'K', 555)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '555' }
  end

  describe '#From F to K calculation value 10' do
    subject do
      temperature = Temperature.new('F', 'K', 10)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '260.92777777777775' }
  end
  describe '#From F to C calculation value 100' do
    subject do
      temperature = Temperature.new('F', 'K', 100)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '310.9277777777778' }
  end
  describe '#From F to F calculation value 1000' do
    subject do
      temperature = Temperature.new('F', 'F', 1000)
      context = Context.new(InitState.new, temperature)
      context.request1
      temperature.result
    end

    it { is_expected.to eq '1000' }
  end
  describe '#From F func' do
    subject do
      temperature = Temperature.new('F', 'M', 1000)
      temperature.from_f
    end
    it { is_expected.to eq 'wrong output letter' }
  end
  describe '#From C func' do
    subject do
      temperature = Temperature.new('C', 'M', 1000)
      temperature.from_c
    end
    it { is_expected.to eq 'wrong output letter' }
  end
  describe '#From K func' do
    subject do
      temperature = Temperature.new('K', 'M', 1000)
      temperature.from_k
    end
    it { is_expected.to eq 'wrong output letter' }
  end
end
