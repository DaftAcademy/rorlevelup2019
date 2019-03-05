require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  attr_reader :price

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  RATE = {
    eur:{eur: 1, pln: 4.32, usd: 1.13},
    usd:{usd: 1, pln: 3.81, eur: 0.88},
    pln:{pln: 1, eur: 0.23, usd: 0.26}
  }.freeze

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    validate_currency(currency)
    (@price.amount*RATE[@price.currency][currency]).round(2)
  end

  private

  def validate_price
    raise InvalidCurrency unless @price.is_a?(Price)
  end

  def validate_currency(currency)
      raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end
