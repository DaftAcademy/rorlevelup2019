require_relative 'price'

class Converter
  
  class InvalidCurrency < StandardError; end

  RATES = {
    eur: { pln: 4.32, usd: 1.13, eur: 1 },
    usd: { pln: 3.81, eur: 0.88, usd: 1 },
    pln: { eur: 0.23, usd: 0.26, pln: 1 }
  }.freeze

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  
  def initialize(price)
    @price = price
  end


  def convert_to(currency)
    validate_currency(currency)
    p (@price.amount * RATES[@price.currency][currency]).round(2)
  end

  #private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end