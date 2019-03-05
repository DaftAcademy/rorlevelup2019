require_relative 'price'

class Converter
  class NotSupportedCurrencyError < StandardError
  end

  EXCHANGE_RATES = {
    eur: { pln: 4.32, eur: 1.00, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88, usd: 1.00 },
    pln: { pln: 1.00, eur: 0.23, usd: 0.26 }
  }.freeze

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def convert_to(currency_to_convert)
    validate_currency currency_to_convert
    new_value = @price.amount*EXCHANGE_RATES[@price.currency][currency_to_convert]
    # jeśli ma być round
    new_value.round(2)
    # jeśli mają być dwa miejsca po przecinku
    # "%.2f" % new_value
  end

  def validate_currency(currency)
    raise NotSupportedCurrencyError unless SUPPORTED_CURRENCIES.include?(currency)
  end
end
