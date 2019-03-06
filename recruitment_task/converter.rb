require_relative 'price'

class Converter
  class InvalidConversion < Price::InvalidCurrency; end

  EXCH_RATES = {
    "EURPLN": 4.32,
    "EURUSD": 1.13,
    "USDPLN": 3.81,
    "USDEUR": 0.88,
    "PLNEUR": 0.23,
    "PLNUSD": 0.26
  }.freeze

  def initialize(price)
    @rate_from = price.currency.to_s.upcase
    @amount = price.amount
  end

  def convert_to(rate_to)
    ratekey = assert_conversion(@rate_from + rate_to.to_s.upcase)
    (EXCH_RATES[ratekey.to_sym] * @amount).round(2)
  end
  
  private
  
  def assert_conversion(ratekey)
    raise InvalidConversion unless EXCH_RATES.include? ratekey.to_sym
    return ratekey
  end

end
