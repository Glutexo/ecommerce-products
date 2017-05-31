require_relative '../lib/price_with_vat'
require_relative '../lib/helper'
require 'test/unit'

class PriceWithVatTest < Test::Unit::TestCase

  # Test constructor.

  def test_price_is_assigned
    price = BigDecimal.new '49999.99'
    price_with_vat = PriceWithVat.new price
    assert_equal price, price_with_vat.price
  end

  # Test value conversion.

  def test_integer_price_is_converted_to_big_decimal
    # Floats not tested as one does not simply create a BigDecimal from a float.
    price_with_vat = PriceWithVat.new 49999
    assert price_with_vat.price.is_a? BigDecimal
    assert_equal BigDecimal.new('49999'), price_with_vat.price
  end

  def test_string_price_is_converted_to_big_decimal
    price_with_vat = PriceWithVat.new '49999.99'
    assert price_with_vat.price.is_a? BigDecimal
    assert_equal BigDecimal.new('49999.99'), price_with_vat.price
  end

  def test_price_with_vat_is_converted_to_big_decimal
    first = PriceWithVat.new '49999.99'
    second = PriceWithVat.new first
    assert second.price.is_a? BigDecimal
    assert_equal first.price, second.price
  end

  # Test computations.

  def test_vat_is_computed
    price_with_vat = PriceWithVat.new '49999.99'
    assert_equal price_with_vat.price * PriceWithVat::VAT_RATE,
                 price_with_vat.vat
  end

  def test_price_with_vat_is_computed
    price_with_vat = PriceWithVat.new '49999.99'
    assert_equal price_with_vat.price + price_with_vat.vat,
                 price_with_vat.price_with_vat
  end

  # Test output.

  def test_printing
    price_with_vat = PriceWithVat.new '49999.99'
    assert_equal "#{Helper.format_price price_with_vat.price} #{Helper.format_price price_with_vat.vat}",
                 price_with_vat.to_s
  end

end
