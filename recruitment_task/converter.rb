require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  EXCHANGE = { eur: {pln: 4.32, usd: 1.13 },
               usd: {pln: 3.81, eur: 0.88 },
               pln: {eur: 0.23, usd: 0.26 }
             }
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def convert_to(new_currency)
    validate_currency(new_currency)
    different_currency?(price, new_currency) ? (price.amount * EXCHANGE[price.currency][new_currency]).round(2) : (price.amount).round(2)
  end

  private

  def validate_currency(new_currency)
    raise InvalidCurrency unless EXCHANGE.keys.include?(new_currency)
  end

  def different_currency?(price, new_currency)
    price.currency != new_currency
  end
end
