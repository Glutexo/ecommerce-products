require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  PRODUCTS = [ Product.new('Smart battery case', '2990.00'),
               Product.new('Lightning to 3.5 mm headphone jack adapter', '279.90') ]

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

  def test_products_are_assigned
    product = Product.new 'MacBook Pro', '49999.99', PRODUCTS
    assert_equal PRODUCTS, product.products
  end

  # Test computations.

  def test_total_is_computed
    product = Product.new 'MacBook Pro', '49999.99', PRODUCTS
    assert_equal product.price + product.sum, product.total
  end

  # Test output.

  def test_simple_name_is_printed
    product = Product.new 'MacBook Pro', '49999.90'
    test_name_and_price_are_printed product
  end

  def test_complex_name_is_printed
    object_with_name = Object.new
    def object_with_name.to_s
      'MacBook Pro'
    end

    # Kind of testing Ruby internals here, but also making sure there is nothing
    # fishy going on.
    product = Product.new object_with_name, '49999.99'
    test_name_and_price_are_printed product
  end

  private
    def test_name_and_price_are_printed product
      assert_equal "#{product.name} #{Helper.format_price product.price}",
                   product.to_s
    end

end
