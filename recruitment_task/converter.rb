require_relative 'price'

class Converter < Price
  class InvalidObject < StandardError; end

  def initialize(price)
    validate_object(price)
    @amount = price.amount
    @currency = price.currency
  end

  def convert_to(currency)
    validate_currency(currency)
    amount = @amount * exchange_rate(@currency, currency)
    amount.round(2)
  end

  private

  def exchange_rate(from, to)
    exchange_table = {
      eur: {
        pln: 4.32,
        eur: 1,
        usd: 1.13
      },
      usd: {
        pln: 3.81,
        eur: 0.88,
        usd: 1
      },
      pln: {
        pln: 1,
        eur: 0.23,
        usd: 0.26
      }
    }

    exchange_table[from][to]
  end

  def validate_object(object)
    raise InvalidObject unless object.instance_of?(Price)
  end

end
