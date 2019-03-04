require_relative 'price'
# frozen_string_literal: true

class Converter
	class InvalidCurrency < StandardError; end

	RATE = {
		:eur => { 
			:pln => 4.32,
			:usd => 1.13,
			:eur => 1
		},
		:usd => { 
			:pln => 3.81,
			:eur => 0.88,
			:usd => 1
		},
		:pln => {
			:eur => 0.23,
			:usd => 0.26,
			:pln => 1
		}
	}.freeze

	attr_reader :amount, :currency

  def initialize(price_obj)
		@amount = price_obj.amount
		@currency = price_obj.currency
  end

	def convert_to(new_currency)
	raise InvalidCurrency unless RATE.include?(new_currency)

	(self.amount * RATE[self.currency][new_currency])
		.round(2)
  end
end
