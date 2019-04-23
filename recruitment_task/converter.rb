require_relative 'price'

class Converter
	class InvalidCurrency < StandardError; end
	SUPPORTED_CURRENCIES = %i[ eur pln usd] 
	
	RATES = { "EUR/PLN" => 4.32, "EUR/USD" => 1.13, "USD/PLN" => 3.81, "USD/EUR" => 0.88, "PLN/EUR" => 0.23, "PLN/USD" => 0.26 }

	def initialize(price)
		@price = price
	end

	def convert_to(convert_currency)
		@convert_currency = convert_currency
		validate_convert_currency 

		if @price.currency == convert_currency
			return @price.amount
		else
			(@price.amount * RATES[[ @price.currency.upcase, convert_currency.upcase].join("/")]).round(2)
		end
	end

	private

	def validate_convert_currency
		raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(@convert_currency)
	end
end
