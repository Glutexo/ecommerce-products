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

end
