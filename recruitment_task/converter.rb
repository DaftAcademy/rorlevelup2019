require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  FROM_EUR = {:usd => 1.13, :pln => 4.32}
  FROM_USD = {:eur => 0.88, :pln => 3.81}
  FROM_PLN = {:eur => 0.23, :usd => 0.26}

  def initialize(original_price)
    @price = original_price
    @courses = {:eur => FROM_EUR, :usd=>FROM_USD, :pln=>FROM_PLN}[@price.currency]
  end
  def convert_to(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
    if(currency.equal?(@price.currency))
      (@price.amount).round(2)
    else
      (@courses[currency]*(@price.amount)).round(2)
    end
  end
end
price_in_euro = Price.new(10, :eur)
puts(converter = Converter.new(price_in_euro))
puts(converter.convert_to(:usd)) # => 11.3
puts(converter.convert_to(:eur)) # => 10
puts(converter.convert_to(:pln)) # => 43.2
converter.convert_to(:xxx) # => raises error