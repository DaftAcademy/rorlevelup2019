require_relative 'price'

class Converter
  SUPPORTED_CURRENCIES = %i[eur usd pln]

  attr_reader :price

  def initialize(price)
    @price = price
  end

  EXCHANGE_RATE = {
    pln: {eur: 0.23, usd: 0.26, pln: 1},
    eur: {eur: 1.00, usd: 1.13, pln: 4.32},
    usd: {eur: 0.88, usd: 1.00, pln: 3.81}
  }

  def convert_to(currency)
    validate_currency(currency)
    p (@price.amount * EXCHANGE_RATE[@price.currency][currency]).round(2)
  end

  private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end

#  TEST PART OF THE TASK

=begin
price_in_euro = Price.new(10.1, :eur)
price_in_usd = Price.new(100.1, :usd)
price_in_pln = Price.new(1000.1, :pln)
converter_euro = Converter.new(price_in_euro)
converter_usd = Converter.new(price_in_usd)
converter_pln = Converter.new(price_in_pln)

p 'EUR to other currencies'
converter_euro.convert_to(:pln)
converter_euro.convert_to(:eur)
converter_euro.convert_to(:usd)
p 'USD to other currencies'
converter_usd.convert_to(:pln)
converter_usd.convert_to(:eur)
converter_usd.convert_to(:usd)
p 'PLN to other currencies'
converter_pln.convert_to(:pln)
converter_pln.convert_to(:eur)
converter_pln.convert_to(:usd)
=end