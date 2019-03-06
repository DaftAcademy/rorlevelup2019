require_relative 'price'
require "rspec/autorun"

class Converter
  class InvalidCurrency < StandardError; end
  class InvalidPrice < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  attr_reader :price

  def initialize(price)
    @price = price
    validate_argument
  end


  def convert_to (new_curr)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(new_curr)

    # Currency foreign exchange as per the task
    curr = { eur: { pln: 4.32, usd: 1.13 },
                  usd: { pln: 3.81, eur: 0.88 },
                  pln: { eur: 0.23, usd: 0.26 }}

    # Provides foreign exchange for the specified currencies pair
    fx = (price.currency == new_curr ? 1 : curr[price.currency][new_curr])

    #Returns value in requested currency
    (price.amount * fx).round(2)
  end

  # Returns error for invalid Converter input type
  def validate_argument
    raise InvalidPrice unless price.class == Price
  end
end

# Tested with RSpec
describe Converter, "object" do
  it "returns correct values with valid arguments" do
    price_in_euro = Price.new(10, :eur)
    converter = Converter.new(price_in_euro)
    expect(converter.convert_to(:usd)).to eq(11.3)
    expect(converter.convert_to(:eur)).to eq(10)
    expect(converter.convert_to(:pln)).to eq(43.2)
  end

  it "returns value rounded to two places" do
    price_in_euro = Price.new(10.0000001, :eur)
    converter = Converter.new(price_in_euro)
    expect(converter.convert_to(:usd)).to eq(11.3)
    expect(converter.convert_to(:usd)).not_to eq(11.300000113)
  end

  it "returns InvalidCurrency error for invalid requested currency" do
    price_in_euro = Price.new(10.0000001, :eur)
    converter = Converter.new(price_in_euro)
    expect { converter.convert_to(:non_existing) }.to raise_error(
                                                    Converter::InvalidCurrency)
  end

  it "returns InvalidPrice error for invalid requested currency" do
    expect { Converter.new("invalid input") }.to raise_error(
                                                    Converter::InvalidPrice)
  end

end
