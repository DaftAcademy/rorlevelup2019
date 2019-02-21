require_relative 'price'
require_relative 'converter'

# price_in_euro = Price.new(21, :eur)
# puts price_in_euro.amount # => 21
# puts price_in_euro.currency # => eur

# price_in_usd = Price.new(10.55, :usd)
# puts price_in_usd.amount # => 10.55
# puts price_in_usd.currency # => usd

# invalid_price = Price.new(37, :qwe) # => raises error Price::InvalidCurrency

price_in_euro = Price.new(10, :eur)
converter = Converter.new(price_in_euro)

puts converter.convert_to(:usd) # => 11.3
puts converter.convert_to(:eur) # => 10
puts converter.convert_to(:pln) # => 43.2
puts converter.convert_to(:xxx) # => raises error