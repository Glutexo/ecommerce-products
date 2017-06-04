require_relative '../lib/cart'
require 'test/unit'

class CartTest < Test::Unit::TestCase

  PRODUCTS = { halfway:   Product.new('MacBook Pro', '55990.99'),
               expensive: Product.new('Mac Pro', '95990.90'),
               cheap:     Product.new('iMac', '39990.00') }

  # Test constructor.

  def test_products_are_assigned
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list, cart.products
  end

  # Test extremes.

  def test_the_cheapest_product_is_found
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:cheap], cart.min
  end

  def test_the_most_expensive_product_is_found
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:expensive], cart.max
  end

  # Test output.

  def test_sum_is_printed
    cart = Cart.new PRODUCTS.values
    assert_equal Helper.format_price(cart.sum), cart.to_s
  end

end
