require_relative 'price'

class Converter
  def initialize price
    @price = price
  end

  def convert_to currency
    case @price.currency
    when :eur
      case currency
      when :pln
        amount = @price.amount * 4.32
      when :usd
        amount = @price.amount * 1.13
      when :eur
        amount = @price.amount
      else
        raise StandardError unless Price::SUPPORTED_CURRENCIES.include?(currency)
      end
    when :usd
      case currency
      when :pln
        amount = @price.amount * 3.81
      when :eur
        amount = @price.amount * 0.88
      when :usd
        amount = @price.amount
      else
        raise StandardError unless Price.SUPPORTED_CURRENCIES.include?(currency)
      end
    when :pln
      case currency
      when :eur
        amount = @price.amount * 0.23
      when :usd
        amount = @price.amount * 0.26
      when :pln
        amount = @price.amount
      else
        raise StandardError unless Price.SUPPORTED_CURRENCIES.include?(currency)
      end
    end
    puts amount.round(2)
  end
end