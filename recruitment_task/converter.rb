require_relative 'price'

class Converter
attr_accessor :price,:currencies

  def initialize(price)
  @price=price
  eur_rate= { :eur =>1.0 , :pln =>4.32 , :usd=>1.13}
  usd_rate= { :eur =>0.88 , :pln =>3.81 , :usd=>1.0}
  pln_rate= { :eur =>0.23 , :pln =>1.0 , :usd=>0.26}
  @currencies={:eur=>eur_rate,:usd=>usd_rate,:pln=>pln_rate}
  end

  def convert_to(other_currency)
  raise StandardError unless currencies.has_key?(other_currency)
  rate=currencies.fetch(@price.currency)[other_currency]
  sum= rate*@price.amount
  return sum.round(2)
  end
  
end


price_in_euro = Price.new(10, :eur)
converter = Converter.new(price_in_euro)
converter.convert_to(:usd) # => 11.3
converter.convert_to(:eur) # => 10
converter.convert_to(:pln) # => 43.2
converter.convert_to(:xxx) # => raises error