require_relative 'price'

class Converter
      class InvalidCurrency < StandardError; end
      SUPPORTED_CURRENCIES = %i[eur usd pln].freeze

      attr_reader :price
      def initialize(price)
        @price=price
      end

      attr_reader :currency
      def convert_to(currency)
        exchange = {  :EUR_PLN => 4.32, :EUR_USD => 1.13 , :USD_PLN => 3.81, :USD_EUR => 0.88, :PLN_EUR => 0.23, :PLN_USD => 0.26}

        @currency=currency
        raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)


        if @currency==price.currency
          puts (price.amount).round(2)
        end

        if SUPPORTED_CURRENCIES[0]==price.currency
          if SUPPORTED_CURRENCIES[2]==@currency
            puts (price.amount*exchange[:EUR_PLN]).round(2)

          elsif SUPPORTED_CURRENCIES[1]==@currency
            puts (price.amount*exchange[:EUR_USD]).round(2)
          end
        end

        if SUPPORTED_CURRENCIES[1]==price.currency
          if SUPPORTED_CURRENCIES[0]==@currency
            puts (price.amount*exchange[:USD_EUR]).round(2)
          elsif SUPPORTED_CURRENCIES[2]==@currency
            puts (price.amount*exchange[:USD_PLN]).round(2)
          end
        end

        if SUPPORTED_CURRENCIES[2]==price.currency
          if SUPPORTED_CURRENCIES[0]==@currency
            puts (price.amount*exchange[:PLN_EUR]).round(2)
          elsif SUPPORTED_CURRENCIES[1]==@currency
            puts (price.amount*exchange[:PLN_USD]).round(2)
          end
        end
      end

end

