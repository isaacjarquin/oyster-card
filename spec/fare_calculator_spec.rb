require_relative '../app/fare_calculator.rb'
require_relative '../app/journey.rb'

describe FareCalculator do
  let(:fare_calculator) {
    described_class.new(daily_journies)
  }

  describe '#calculate' do
    subject(:calculate) { fare_calculator.calculate }

    context 'Given a single trip by bus' do
      let(:journey) { Journey.new("bus") }
      let(:daily_journies) { [journey] }

      it 'returns 1.80' do
        expect(calculate).to eql(1.80)
      end
    end
  end
end