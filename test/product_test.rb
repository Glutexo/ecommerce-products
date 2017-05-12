require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  # Start with a few rather useless tests just for the sake of having some.

  def test_product_has_name
    name = 'MacBook Pro'

    product = ECommerce::Product.new name, 49999.99
    assert_equal name, product.name
  end

  def test_product_has_price
    price = 49999.99

    product = ECommerce::Product.new 'MacBook Pro', price
    assert_equal price, product.price
  end

  # Test value conversion.

  def test_name_is_string
    product = ECommerce::Product.new({ line: 'MacBook', variety: 'Pro' },
                                     49999.99)
    assert product.name.is_a? String
  end

  def test_price_is_float
    product = ECommerce::Product.new 'MacBook Pro', 49999
    assert product.price.is_a? Float
  end

  def test_price_is_rounded
    product = ECommerce::Product.new 'MacBook Pro', 49999.985
    assert_equal 49999.99, product.price
  end

  # Test output.

  def test_product_is_printable
    product = ECommerce::Product.new 'MacBook Pro', 49999.90
    assert_equal 'MacBook Pro (49 999,90 Kč)', product.to_s
  end

end
