require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  
  EXCHANGE_RATE = {
    pln: { eur: 0.23, usd: 0.26 },
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 }
    }.freeze

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    @price.amount * (currency != @price.currency ? EXCHANGE_RATE[@price.currency][currency] : 1 )
    .round(2) rescue raise Price::InvalidCurrency
  end

  private

  def validate_price
    raise InvalidCurrency unless @price.instance_of? Price
  end
  
end
