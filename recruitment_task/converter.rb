require_relative 'price'

class Converter
  class InvalidCurrencyError < StandardError; end

  def initialize(price)
    @price = price
  end

  def convert_to(currency)
    validate_currency(currency)
    (exchange_rate(currency) * exchange_amount).round(2)
  end

  private

  EXCHANGE_RATES = {
    eur: { pln: 4.32, usd: 1.13, eur: 1 },
    usd: { pln: 3.81, eur: 0.88, usd: 1 },
    pln: { eur: 0.23, usd: 0.26, pln: 1 }
  }.freeze

  def validate_currency(currency)
    raise InvalidCurrencyError unless EXCHANGE_RATES.key?(currency)
  end

  def exchange_rate(currency)
    EXCHANGE_RATES[@price.currency][currency]
  end

  def exchange_amount
    @price.amount
  end
end
