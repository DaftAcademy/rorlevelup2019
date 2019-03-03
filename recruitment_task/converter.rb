require_relative 'price'

class Converter
  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def convert_to(currency)
    validate_currency(currency)

    converse ||= { usd: {usd: 1, eur: 0.88, pln: 3.81 },
                   pln: {pln: 1, usd: 0.26, eur: 0.23},
                   eur: {eur: 1, usd: 1.13, pln: 4.32 }
    }
    (converse[price.currency][currency] * price.amount).round(2)
  end

  private

  def validate_currency(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end

end


price_in_euro = Price.new(10, :eur)
puts "current course"
puts price_in_euro.amount
puts price_in_euro.currency
converter = Converter.new(price_in_euro)
puts "exchange rate in a different currency"
puts converter.convert_to(:usd)
puts converter.convert_to(:eur)
puts converter.convert_to(:pln)
puts converter.convert_to(:xxx)