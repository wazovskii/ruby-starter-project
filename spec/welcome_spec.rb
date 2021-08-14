require './lib/welcome'

RSpec.describe Welcome do
  describe '#hello' do
    subject { Welcome.new('Harry').greet }

    it { is_expected.to eq 'Hello Harry' }
  end
end
