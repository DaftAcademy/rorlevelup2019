require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  EXCHANGE_RATE = {
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 },
    pln: { eur: 0.23, usd: 0.26 }
  }.freeze

  def initialize(price)
    @price = price
  end

  def convert_to(currency)
    validate_currency currency
    rate = EXCHANGE_RATE[@price.currency][currency]
    result = rate ? @price.amount * rate : @price.amount
    result.round(2)
  end

  private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end
end
