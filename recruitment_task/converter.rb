require_relative 'price'

class Converter
  CURRENCIES = {
    usd: { pln: 3.81, usd: 1,    eur: 0.88 },
    eur: { pln: 4.32, usd: 1.13, eur: 1    },
    pln: { pln: 1,    usd: 0.26, eur: 0.23 }
  }.freeze

  def initialize(price)
    @price = price
  end 

  def convert_to(currency)
    (@price.amount * CURRENCIES[@price.currency][currency]).round(2)
  end 
end

