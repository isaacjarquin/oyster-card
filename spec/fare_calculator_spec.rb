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

    context 'Given there is a missing swipe out' do
      let(:journey) { Journey.new("tube") }
      let(:daily_journies) { [journey] }

      before do
        journey.swipe_in("Holborn")
      end

      it 'returns the maximun fare of 3.20' do
        expect(calculate).to eql(3.20)
      end
    end
  end
end