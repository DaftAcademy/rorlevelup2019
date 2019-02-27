require_relative 'price'

class Converter
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
    rate = @price.currency == targetCurrency ? 1 : @exchange["#{@price.currency}2#{targetCurrency}".to_sym]
    sprintf('%.2f', @price.amount * rate)
  end
end
