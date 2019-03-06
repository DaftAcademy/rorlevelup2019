require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end
  class InvalidPrice < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  attr_reader :price

  def initialize(price)
    @price = price
    validate_argument
  end


  def convert_to (new_curr)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(new_curr)

    # Currency foreign exchange as per the task
    curr = { eur: { pln: 4.32, usd: 1.13 },
                  usd: { pln: 3.81, eur: 0.88 },
                  pln: { eur: 0.23, usd: 0.26 }}

    # Provides foreign exchange for the specified currencies pair
    fx = (price.currency == new_curr ? 1 : curr[price.currency][new_curr])

    #Returns value in requested currency
    (price.amount * fx).round(2)
  end

  # Returns error for invalid Converter input type
  def validate_argument
    raise InvalidPrice unless price.class == Price
  end
end
