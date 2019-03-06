require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze
  FROM_EUR = {:usd => 1.13, :pln => 4.32}
  FROM_USD = {:eur => 0.88, :pln => 3.81}
  FROM_PLN = {:eur => 0.23, :usd => 0.26}

  def initialize(original_price)
    @price = original_price
    case @price.currency
    when :usd
      @courses = FROM_USD
    when :eur
      @courses = FROM_EUR
    when :pln
      @courses = FROM_PLN
    else
      raise InvalidCurrency
    end
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