require_relative 'price'

class Converter
  class UnsupportedCurrency < StandardError
    def message
      'Currency is not supported yet'
    end
  end

  class InvalidPrice < StandardError
    def message
      'Argument must be a Price object'
    end
  end

  CONVERSION_RATES = {
      eur: { pln: 4.32, usd: 1.13, eur: 1 },
      usd: { pln: 3.81, usd: 1, eur: 0.88 },
      pln: { pln: 1, usd: 0.26, eur: 0.23 }
  }.freeze

  attr_reader :price

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    validate_currency(currency)
    result = conversion_amount * conversion_rate(currency)
    result.round(2)
  end

  private

  def conversion_amount
    @price.amount
  end

  def conversion_rate(currency)
    CONVERSION_RATES[@price.currency][currency]
  end

  def validate_price
    raise InvalidPrice unless price.is_a?(Price)
  end

  def validate_currency(currency)
    raise UnsupportedCurrency unless CONVERSION_RATES.key?(currency)
  end
end