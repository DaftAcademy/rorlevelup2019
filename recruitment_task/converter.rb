require_relative 'price'

class Converter
  # TODO: Implement me
  def initialize(price)
    @price = price
  end

=begin
  def convert_to2(currency)
    eur_pln = 4.32
    eur_usd = 1.13
    usd_pln = 3.81
    usd_eur = 0.88
    pln_eur = 0.23
    pln_usd = 0.26

    case
      when @price.currency == currency
      	result = @price.amount
      when @price.currency == :eur && currency == :pln
        result = @price.amount * eur_pln
      when @price.currency == :eur && currency == :usd
        result = @price.amount * eur_usd
      when @price.currency == :usd && currency == :pln
        result = @price.amount * usd_pln
      when @price.currency == :usd && currency == :eur
        result = @price.amount * usd_eur
      when @price.currency == :pln && currency == :eur
        result = @price.amount * pln_eur
      when @price.currency == :pln && currency == :usd
        result = @price.amount * pln_usd
      else
        result = 'error: improper price or currency'
    end

    if result.is_a? String
      p result
    else
      p result.round(2)
    end
  end
=end

  def convert_to(currency)

    factor = { eur_pln: 4.32, eur_usd: 1.13, usd_pln: 3.81, usd_eur: 0.88, pln_eur: 0.23, pln_usd: 0.26 }

    currency_f = @price.currency.to_s.concat('_', currency.to_s).to_sym

    if factor.has_key?(currency_f)
      p (factor[currency_f] * @price.amount).round(2)
    elsif currency == @price.currency
      p @price.amount.round(2)
    else
      p 'error: improper price or currency'
    end
  end
end

# tests
price_in_euro = Price.new(10.12331132, :eur)
converter = Converter.new(price_in_euro)

converter.convert_to(:usd) # => 11.3
converter.convert_to(:eur) # => 10
converter.convert_to(:pln) # => 43.2
converter.convert_to(:xxx) # => raises error