require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  attr_accessor :price
  EXCHANGE_RATES = {
                    pln: {eur: 0.23, usd: 0.26 },
                    eur: {pln: 4.32, usd: 1.13 },
                    usd: {pln: 3.81, eur: 0.88 }
                    }

  def initialize(price)
    @price = price
  end

  def convert_to(another_currency)
    validate_currency(another_currency)
    if price.currency == another_currency
      (price.amount).round(2)
    else
      (price.amount * EXCHANGE_RATES[price.currency][another_currency]).round(2)
    end
  end

  private

  def validate_currency(another_currency)
    raise InvalidCurrency unless EXCHANGE_RATES.keys.include?(another_currency)
  end

end
