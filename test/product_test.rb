require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  # Test value conversion.

  def test_integer_price_is_converted_to_big_decimal
    # Floats not tested as one does not simply create a BigDecimal from a float.
    product = Product.new 'MacBook Pro', 49999
    assert_equal BigDecimal.new('49999'), product.price
  end

  def test_string_price_is_converted_to_big_decimal
    product = Product.new 'MacBook Pro', '49999.99'
    assert product.price.is_a? BigDecimal
    assert_equal BigDecimal.new('49999.99'), product.price
  end

  def test_big_decimal_price_is_not_converted
    price = BigDecimal.new '49999.99'
    product = Product.new 'MacBook Pro', price
    assert_same price, product.price
  end

  # Test output.

  def test_simple_name_is_printed
    product = Product.new 'MacBook Pro', '49999.90'
    assert_equal 'MacBook Pro 49999.9', product.to_s
  end

  def test_complex_name_is_printed
    object_with_name = Object.new
    def object_with_name.to_s
      'MacBook Pro'
    end

    # Kind of testing Ruby internals here, but also making sure there is nothing
    # fishy going on.
    product = Product.new object_with_name, '49999.99'
    assert_equal 'MacBook Pro 49999.99', product.to_s
  end

  def test_price_uses_float_notation
    product = Product.new 'MacBook Pro', '49999'
    assert_equal 'MacBook Pro 49999.0', product.to_s
  end

  def test_price_is_not_rounded
    product = Product.new 'MacBook Pro', '49999.985'
    assert_equal 'MacBook Pro 49999.985', product.to_s
  end

  # Test computations.

  def test_vat_is_computed
    product = Product.new 'MacBook Pro', '49999.99'
    assert_equal product.price * Product::VAT_RATE, product.vat
  end

  def test_price_with_vat_is_computed
    product = Product.new 'MacBook Pro', '49999.99'
    assert_equal product.price + product.vat, product.price_with_vat
  end

end
