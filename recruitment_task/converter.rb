require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  class InvalidInputClass < StandardError; end
  class InvalidAmount < StandardError; end
  class ConverterUnexpectedError < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  CURRENCY_LIST =  {"eurpln" => 4.32, 
                    "eurusd" => 1.13, 
                    "usdpln" => 3.81, 
                    "usdeur" => 0.88, 
                    "plneur" => 0.23, 
                    "plnusd" => 0.26}
                   

  def initialize(price)
    @price = price
    validate_class
  end

  def convert_to(currency)

    @currency = currency   
    validate_currency
    validate_amount

    begin
      (@price.amount*CURRENCY_LIST[[@price.currency, currency].join()]).round(2)
    rescue
      @price.currency == currency ? @price.amount : (raise ConverterUnexpectedError)
    end

  end

  private

  def validate_currency
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(@currency)
  end

  def validate_class
    raise InvalidInputClass unless @price.is_a? Price
  end

#this should be in Price class, but I'm not allowed to change it
  def validate_amount
    raise InvalidAmount unless @price.amount.is_a? Numeric
  end
end
