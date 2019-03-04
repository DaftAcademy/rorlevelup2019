gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/converter'

class ConverterTest < Minitest::Test
    def setup
        @price = Price.new(10, :eur)
        @converter = Converter.new(@price)
        @price2 = Price.new(99, :pln)
        @converter2 = Converter.new(@price2)
    end

    def test_that_price_object_was_created
        assert_equal 10, @price.amount
        assert_equal :eur, @price.currency
    end

    def test_that_converter_object_was_created_with_price_object
        assert_equal 10, @converter.amount
        assert_equal :eur, @converter.currency
    end

    def test_if_price_object_with_not_supported_currency_raises_an_error
        assert_raises(Converter::InvalidCurrency) { @converter.convert_to(:xxx) }
    end

    def test_if_convertion_is_proper
        assert_equal 11.3, @converter.convert_to(:usd)
        assert_equal 10, @converter.convert_to(:eur)
        assert_equal 43.2, @converter.convert_to(:pln)
    end

    def test_if_result_quota_is_rounded_to_two_decimal_places
        assert_equal 22.77, @converter2.convert_to(:eur)
    end
end
