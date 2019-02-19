require_relative 'price'

class Converter
  
    CONVERSIONS = {
      %i[eur pln].freeze => 4.32,
      %i[eur usd].freeze => 1.13,
      %i[usd pln] => 3.81,
      %i[usd eur] => 0.88,
      %i[pln eur] => 0.23,
      %i[pln usd] => 0.26
  }.freeze

  class InvalidPriceType < TypeError
      def message
          "Provided price must be instance of Price class"
      end
  end

  def initialize(price)
      # Raise error if price isn't instance of Price class
      raise InvalidPriceType unless price.is_a? Price
      @prices = Hash.new()
      @original_currency = price.currency
      @prices[price.currency] = price.amount
  end

  def calculate_new_price(currency)
      return (CONVERSIONS[[@original_currency, currency]]*@prices[@original_currency]).round(2)
  end

  def convert_to(currency)
      raise Price::InvalidCurrency unless Price::SUPPORTED_CURRENCIES.include?(currency)
      @prices[currency] = calculate_new_price(currency) unless @prices.key?(currency)
      return @prices[currency]
  end
end