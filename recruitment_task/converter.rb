require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  SUPPORTED_CURRENCIES=%i[eur usd pln].freeze
  CHANGE = {
    eur: {eur: 1, pln: 4.32, usd: 1.13},
    usd: {usd: 1, pln: 3.81, eur: 0.88},
    pln: {pln: 1, eur: 0.23, usd: 0.26}
  }.freeze
  
  def initialize(price)
    @price=price
  end

  def convert_to(currency)
    validate_currency(currency)
    (@price.amount*CHANGE[@price.currency][currency]).round(2)
  end

  private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end

  def validate_price
    raise InvalidCurrency unless @price.instance_of? Price  
  end

end
