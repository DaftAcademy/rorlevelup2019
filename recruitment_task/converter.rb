require_relative 'price'

class Converter < Price
  class InvalidCurrency < StandardError; end
  
  EXCHANGE_RATES = {
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 },
    pln: { eur: 0.23, usd: 0.26 }
  }.freeze

  def initialize(price)
    @price = price
  end

  def convert_to(currency)
    (currency != @price.currency ? 
    @price.amount * EXCHANGE_RATES[@price.currency][currency] : 
    @price.amount).round(2) rescue raise InvalidCurrency
  end
end

