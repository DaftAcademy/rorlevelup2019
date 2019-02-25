require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  class InvalidObject < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  attr_reader :currency, :price

  def initialize(price)
    @price = price
    validate_object
  end

  def convert_to(currency)
    @currency = currency
    validate_currency
    multiplier =
      case [@price.currency, currency]
        when [:eur, :pln]
          4.32
        when [:eur, :usd]
          1.13
        when [:usd, :pln]
          3.81
        when [:usd, :eur]
          0.88
        when [:pln, :eur]
          0.23
        when [:pln, :usd]
          0.26
        else
          1
      end

  (multiplier * @price.amount).round(2)

  end

  private

  def validate_currency
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
  end

  def validate_object
    raise InvalidObject unless price.respond_to?(:currency) && price.respond_to?(:amount) && price.amount.is_a?(Numeric) && SUPPORTED_CURRENCIES.include?(price.currency)
  end

end
