require_relative 'price'

class Converter
  class InvalidCurrency < StandardError;
  end
  class InvalidPrice < StandardError;
  end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze


  def initialize(price)
    # p price.class
    validate_price(price)
    @price = price
  end

  def convert_to(new_currency)
    validate_currency(new_currency)
    new_amount = @price.amount
    if @price.currency != new_currency
      exchange = [@price.currency, new_currency]
      case exchange
      when [:eur, :pln]
        new_amount = @price.amount * 4.32
      when [:eur, :usd]
        new_amount = @price.amount * 1.13
      when [:usd, :pln]
        new_amount = @price.amount * 3.81
      when [:usd, :eur]
        new_amount = @price.amount * 0.88
      when [:pln, :eur]
        new_amount = @price.amount * 0.23
      when [:pln, :usd]
        new_amount = @price.amount * 0.26
      end
    end
    new_amount.round(2)
  end

  def validate_price(price)
    raise InvalidPrice, "This is not an object of type 'Price'" unless price.class.equal?(Price)
  end

  def validate_currency(new_currency)
    raise InvalidCurrency, new_currency.to_s + " is the wrong currency for exchange" unless SUPPORTED_CURRENCIES.include?(new_currency)
  end
end
