require_relative 'price'

class Converter
  def initialize(price)
    @amount = price.amount
    @currency = price.currency
    @eur_to = { pln: '4.32', usd: '1.13', eur: '1' }
    @usd_to = { pln: '4.81', usd: '1',    eur: '0.88' }
    @pln_to = { pln: '1',    usd: '0.26', eur:'0.23' }
  end

  def convert_to(currency)
    Price.new(@amount, currency)
    exchange_rate = instance_variable_get("@#{@currency}_to")
    (@amount*exchange_rate[currency].to_f).round(2)
  end
end

