require_relative 'price'

class Converter < Price
  
  EXCHANGE = {
    eur: { pln: 4.32, eur: 1.00, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88, usd: 1.00 },
    pln: { pln: 1.00, eur: 0.23, usd: 0.26 }
  }.freeze 
  
  def initialize(price)
    @price = price
  end

  def convert_to(currency)
    validate_currency(currency)
    (@price.amount * EXCHANGE[@price.currency][currency]).round(2)
  end

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end
