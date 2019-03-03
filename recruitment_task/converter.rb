require_relative 'price'

class Converter < Price
	EXCHANGE_RATES = {
    eur: { pln: 4.32, usd: 1.13 },
    usd: { pln: 3.81, eur: 0.88 },
    pln: { eur: 0.23, usd: 0.26 }
    }

    def initialize(price)
    	@price = price
    end

    def convert_to(currency)
    	validate_currency(currency)
    	(price.amount * EXCHANGE_RATES[price.currency][currency]).round(2)
    end

    def validate_currency
    	raise InvalidCurrency unless SUPPORTED_CURRENCIES.include?(currency)
    end
end
