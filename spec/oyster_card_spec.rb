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
end