# frozen_string_literal: true

require_relative 'price'

class Converter
  class InvalidPriceObject < StandardError
    def message
      'Argument must be instance of Price class'
    end
  end

  CURRENCIES = {
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 },
    pln: { eur: 0.23, usd: 0.26 }
  }.freeze

  def initialize(price)
    @price = price
    validate_price
  end

  def convert_to(currency)
    raise Price::InvalidCurrency unless Price::SUPPORTED_CURRENCIES.include?(currency)

    converted_price = if currency == @price.currency
                        @price.amount
                      else
                        @price.amount * CURRENCIES[@price.currency][currency]
                      end
    converted_price.round 2
  end

  private

  def validate_price
    raise InvalidPriceObject unless @price.instance_of? Price
  end
end
