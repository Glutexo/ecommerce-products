require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  # Test value conversion.

  def test_integer_price_is_converted_to_big_decimal
    # Floats not tested as one does not simply create a BigDecimal from a float.
    product = ECommerce::Product.new 'MacBook Pro', 49999
    assert_equal BigDecimal.new('49999'), product.price
  end

  def test_string_price_is_converted_to_big_decimal
    product = ECommerce::Product.new 'MacBook Pro', '49999.99'
    assert product.price.is_a? BigDecimal
    assert_equal BigDecimal.new('49999.99'), product.price
  end

  def test_big_decimal_price_is_not_converted
    price = BigDecimal.new '49999.99'
    product = ECommerce::Product.new 'MacBook Pro', price
    assert_same price, product.price
  end

  # Test output.

  def test_print_product_with_simple_name
    product = ECommerce::Product.new 'MacBook Pro', '49999.90'
    assert_equal 'MacBook Pro (49 999,90 Kč)', product.to_s
  end

  def test_print_product_with_precise_price
    product = ECommerce::Product.new 'MacBook Pro', '49999.985'
    assert_equal 'MacBook Pro (49 999,99 Kč)', product.to_s
  end

  def test_print_product_with_complex_name
    object_with_name = Object.new
    def object_with_name.to_s
      'MacBook Pro'
    end

    # Kind of testing Ruby internals here, but also making sure there is nothing
    # fishy going on.
    product = ECommerce::Product.new object_with_name, '49999.99'
    assert_equal 'MacBook Pro (49 999,99 Kč)', product.to_s
  end

end
