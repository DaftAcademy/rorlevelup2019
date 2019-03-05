require_relative 'price'
require_relative 'converter'

RSpec.describe Converter do
  let(:price) { Price.new(10, :eur) }

  subject { described_class.new(price) }

  context 'provided with valid price' do
    it 'converts the price to USD' do
      expect(subject.convert_to(:usd)).to eq(11.3)
    end

    it 'converts the price to PLN' do
      expect(subject.convert_to(:pln)).to eq(43.2)
    end

    it 'converts the price to EUR' do
      expect(subject.convert_to(:eur)).to eq(10)
    end
  end

  context 'when the currency is not supported' do
    it 'raises an error' do
      expect { subject.convert_to(:xxx) }.to raise_error(Converter::InvalidCurrencyError)
    end
  end
end
