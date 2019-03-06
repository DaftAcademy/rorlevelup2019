require_relative 'price'

class Converter
  class InvalidPrice < StandardError; end
  class InvalidCurrency < StandardError; end
  
  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  CONVERTION_VALUES = { eur: { pln: 4.32, usd: 1.13},
						usd: { pln: 3.81, eur: 0.88},
						pln: { eur: 0.23, usd: 0.26}}
  
  attr_reader :price
  
  def initialize(price)
    @price = price
    validate_price
  end
  
  def convert_to(currency)
	validate_currency(currency)
	if currency==@price.currency
		@price.amount.round(2) 
	else
		(CONVERTION_VALUES[@price.currency][currency]*@price.amount).round(2)
	end
end
  
  def validate_price
	raise InvalidCurrency unless @price.is_a? Price
  end
  
  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
  
  
end

# price_in_euro = Price.new(10, :eur)
# converter = Converter.new(price_in_euro)
# puts converter.convert_to(:usd) # => 11.3
# puts converter.convert_to(:eur) # => 10
# puts converter.convert_to(:pln) # => 43.2
# converter.convert_to(:xxx) # => raises error
