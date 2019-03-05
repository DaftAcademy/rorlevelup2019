# frozen_string_literal: true

require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  attr_reader :price

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  CONVERSION_RATES = {
      eur: { pln: 4.32, usd: 1.13 },
      usd: { pln: 3.81, eur: 0.88 },
      pln: { eur: 0.23, usd: 0.26 }
  }.freeze

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    validate_conversion_currency(currency)
    return @price.amount if currency.equal?(@price.currency)
    (@price.amount * CONVERSION_RATES[@price.currency][currency]).round(2)
  end

  private

  def validate_price
    raise InvalidCurrency unless @price.instance_of? Price
  end

  def validate_conversion_currency(currency)
    raise InvalidCurrency unless CONVERSION_RATES.keys.include?(currency)
  end
end
