require_relative 'price'

class Converter
  class InvalidPrice < StandardError; end
  class InvalidCurrency < StandardError; end

  EXCHANGE_RATE = {
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 },
    pln: { eur: 0.23, usd: 0.26 }    
  }

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    @currency = currency
    validate_currency
    multiplier = (@price.currency == currency ? 1 : EXCHANGE_RATE[@price.currency][currency])
    (@price.amount*multiplier).round(2)
  end

  def validate_price
    raise InvalidPrice unless @price.instance_of? Price 
  end

  def validate_currency
    raise InvalidCurrency unless %i[eur usd pln].include?(@currency)
  end
end

