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

    context 'Given a single journey outside of zone 1' do
      let(:journey) { Journey.new("tube") }
      let(:daily_journies) { [journey] }

      before do
        journey.swipe_in("Hammersmith")
        journey.swipe_out("Wimbledon")
      end

      it 'returns 1.80' do
        expect(calculate).to eql(2.0)
      end
    end

    context 'Given two journeys ouside zone one' do
      let(:journey) { Journey.new("tube") }
      let(:second_journey) { Journey.new("tube") }
      let(:daily_journies) { [journey, second_journey] }

      before do
        journey.swipe_in("Hammersmith")
        journey.swipe_out("Wimbledon")

        second_journey.swipe_in("Wimbledon")
        second_journey.swipe_out("Hammersmith")
      end

      it 'returns 2.25' do
        expect(calculate).to eql(2.25)
      end
    end

    context 'Given single journey in zone one' do
      let(:journey) { Journey.new("tube") }
      let(:daily_journies) { [journey] }

      before do
        journey.swipe_in("Holborn")
        journey.swipe_out("Earl’s Court")
      end

      it 'returns 2.50' do
        expect(calculate).to eql(2.5)
      end
    end

    context 'Given any two zones including zone 1' do
      let(:journey) { Journey.new("tube") }
      let(:second_journey) { Journey.new("tube") }
      let(:daily_journies) { [journey, second_journey] }

      before do
        journey.swipe_in("Holborn")
        journey.swipe_out("Earl’s Court")

        second_journey.swipe_in("Earl’s Court")
        second_journey.swipe_out("Wimbledon")
      end

      it 'returns 3.00' do
        expect(calculate).to eql(3.0)
      end
    end
  end
end