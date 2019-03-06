require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  RATE =
  {
      :eur => {:usd => 1.13, :pln => 4.32},
      :usd => {:eur => 0.88, :pln => 3.81},
      :pln => {:eur => 0.23, :usd => 0.26}
  }

  def initialize(original_price)
    @price = original_price
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(@prize.currency)
    @courses = RATE[@prize.currency]
  end
  def convert_to(currency)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
    if(currency.equal?(@price.currency))
      (@price.amount).round(2)
    else
      (@courses[currency]*(@price.amount)).round(2)
    end
  end
end