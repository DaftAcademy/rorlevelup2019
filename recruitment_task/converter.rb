require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  
  EXCHANGE_RATES = {
	eur:{usd: 1.13, pln: 4.32},
	usd:{eur: 0.88, pln: 3.81},
	pln:{eur: 0.23, usd: 0.26}
  }
  
  attr_reader :price
  
  def initialize(price)
    @price = price
  end
  
  def convert_to(currency)
    validate_currency(currency)
	multiplier = EXCHANGE_RATES[@price.currency][currency]
	result = (currency == @price.currency) ? @price.amount : @price.amount*multiplier
	result.round(2)
  end
  
    private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end