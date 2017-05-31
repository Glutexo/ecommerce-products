require_relative '../lib/price'
require_relative '../lib/helper'
require 'test/unit'

class PriceTest < Test::Unit::TestCase

  # Test constructor.

  def test_price_is_assigned
    amount = BigDecimal.new '49999.99'
    price = Price.new amount
    assert_equal amount, price.without_vat
  end

  # Test value conversion.

  def test_integer_price_is_converted_to_big_decimal
    # Floats not tested as one does not simply create a BigDecimal from a float.
    price = Price.new 49999
    assert price.without_vat.is_a? BigDecimal
    assert_equal BigDecimal.new('49999'), price.without_vat
  end

  def test_string_price_is_converted_to_big_decimal
    price = Price.new '49999.99'
    assert price.without_vat.is_a? BigDecimal
    assert_equal BigDecimal.new('49999.99'), price.without_vat
  end

  def test_price_is_converted_to_big_decimal
    first = Price.new '49999.99'
    second = Price.new first
    assert second.without_vat.is_a? BigDecimal
    assert_equal first.without_vat, second.without_vat
  end

  # Test computations.

  def test_vat_is_computed
    price = Price.new '49999.99'
    assert_equal price.without_vat * Price::VAT_RATE, price.vat
  end

  def test_price_with_vat_is_computed
    price = Price.new '49999.99'
    assert_equal price.without_vat + price.vat, price.with_vat
  end

  # Test internalities.

  def test_equality
    amount = BigDecimal.new '49999.99'
    first = Price.new amount
    second = Price.new amount
    assert_equal second, first
  end

  def test_printing
    price = Price.new '49999.99'
    assert_equal "#{Helper.format_price price.without_vat} #{Helper.format_price price.vat}",
                 price.to_s
  end

  # Test summing.

  def test_sum_is_computed
    first = BigDecimal.new '49999.99'
    second = BigDecimal.new '39990.00'
    assert_equal Price.new(first + second),
                 Price.sum([Price.new(first), Price.new(second)])
  end

end
