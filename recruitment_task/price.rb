# frozen_string_literal: true

class Price
  class InvalidCurrency < StandardError; end

  SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
    validate_currency(currency)
  end

  private

  def validate_currency(curr)
    raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(curr)
  end
end
