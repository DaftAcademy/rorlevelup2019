require_relative 'price'

class Converter < Price
  def initialize(price)
    @price = price
    @exchange = {
      eur2pln: 4.32,
      eur2usd: 1.13,
      usd2pln: 3.81,
      usd2eur: 0.88,
      pln2eur: 0.23,
      pln2usd: 0.26
  }.freeze
  end

  def convert_to(targetCurrency)
    raise InvalidCurrency unless %i[eur usd pln].include?(targetCurrency)
    rate = @price.currency == targetCurrency ? 1 : @exchange["#{@price.currency}2#{targetCurrency}".to_sym]
    (@price.amount * rate).round(2)
  end
end