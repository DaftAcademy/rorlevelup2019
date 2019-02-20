require_relative 'price'

class Converter
	class InvalidCurrency < StandardError; end

  	SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

	attr_reader :price


	def initialize(price)
		@price = price
	end

	def convert_to(currency)
		validate_currency(currency)

		convert_table ||= { 
		:usd => {
			:usd => 1,
		 	:eur => 0.88,
		 	:pln => 3.81
		 	},
		:pln => {
				:pln => 1,
		 		:usd => 0.26,
		 		:eur => 0.23
			},
		:eur => {
				:eur => 1,
				:usd => 1.13,
				:pln => 4.32
			}
		}
		( convert_table[price.currency][currency] * price.amount ).round( 2 )
	end

	private

	def validate_currency(currency)
    	raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
	end
end