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
end