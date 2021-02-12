require_relative '../app/oyster_card.rb'

describe OysterCard do
  let(:oyster_card) {
    described_class.new(30.00)
  }

  describe '#balance' do
    it 'returns the balance' do
      expect(oyster_card.balance).to eql(30.00)
    end
  end

  describe '#update_balance' do
    it 'returns the updated balance' do
      expect(oyster_card.update_balance(3.0)).to eql(27.0)
    end
  end

  describe '#new_journey' do
    it 'returns and instance of Journey' do
      expect(oyster_card.new_journey("bus")).to be_an_instance_of(Journey)
    end
  end

  describe 'todays_journey' do
    it 'returns journeys from today' do
      journey = oyster_card.new_journey("tube")
      second_journey = oyster_card.new_journey("tube")

      allow(second_journey).to receive(:date).and_return(Date.today - 1)
      expect(oyster_card.todays_journey).to eql([journey])
    end
  end
end