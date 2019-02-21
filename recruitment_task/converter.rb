require_relative 'price'

class Converter
  
  #schema is {from: { to: exchange, to: exchange}}
  CONVERTIONS = {
  eur: {
  pln: 4.32,
  usd: 1.13
  },
  usd: {
  pln: 3.81,
  eur: 0.88
  },
  pln: {
  eur: 0.23,
  usd: 0.26
  }
  }.freeze
  
  class UnsupportedCurrency < StandardError
    
    SUPPORTED_CURENCIES = CONVERTIONS.map { |k,v| k}
    
    def initialize(msg="Please provide one of avilable currencies #{SUPPORTED_CURENCIES.to_s}")
      super
    end
  end
  
  class ConversionToSameCurrency < StandardError
    def initialize(msg="whats the point?!")
      super
    end
  end
  
  class InvalidPrice < StandardError
    def initialize(msg="Converter needs #{Price.name} object as a parameter")
      super
    end
  end
  
  def initialize(price)
    @price = price
    validate_price
  end
  
  def convert_to(target_currency)
    begin
      raise UnsupportedCurrency unless CONVERTIONS.include?(target_currency)
      raise ConversionToSameCurrency if @price.currency == target_currency
      rescue UnsupportedCurrency => e
      puts e
      return nil
      rescue ConversionToSameCurrency => e
      #puts e
      return @price.amount
    end
    
    # Calculate new amount
    exchange_rate = CONVERTIONS[@price.currency][target_currency]
    new_amount = @price.amount * exchange_rate
    
    new_amount.round(2)
  end
  
  private
  
  def validate_price
    raise InvalidPrice unless @price.instance_of? Price
  end
  
end
