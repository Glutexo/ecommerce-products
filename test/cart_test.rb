require_relative '../lib/cart'
require 'test/unit'

class CartTest < Test::Unit::TestCase

  def test_cart_has_products
    products = [
        Product.new('MacBook Pro', '55990.00'),
        Product.new('iMac', '39990.00')
    ]
    cart = Cart.new products
    assert_equal products, cart.products
  end

end
