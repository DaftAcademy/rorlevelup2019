require_relative 'price'

class Converter < Price
  attr_reader :input_price

  def initialize(input_price)
    @input_price = input_price
  end
  
  POS = {eur: 0, usd: 1, pln: 2}.freeze
  RATES = [
    [1, 1.13, 4.32].freeze,
    [0.88, 1, 3.81].freeze,
    [0.23, 0.26, 1].freeze
].freeze

  def exchange_rate(from, to)
    row = POS[from] 
    col = POS[to]  
    RATES[row][col]
  end

  def convert_to(target_curr)
    raise InvalidCurrency.new unless POS.keys.include?(target_curr)
    rate = exchange_rate(input_price.currency, target_curr)
    input_val = input_price.amount.to_f
    sprintf('%.2f',(rate * input_val))
  end
end