require_relative '../lib/cart'
require 'test/unit'

class CartTest < Test::Unit::TestCase

  SIMPLE_PRODUCTS = { halfway:   Product.new('MacBook Pro', '55990.99'),
                      expensive: Product.new('Mac Pro', '95990.90'),
                      cheap:     Product.new('iMac', '39990.00') }

  NESTED_PRODUCTS = {
      cheap:     Product.new('iPhone 7', '21190.0'),
      expensive: Product.new('Apple Watch Series 2',
                             '19490.0',
                             [ Product.new('Magnetic charging cable', '899.0'),
                               Product.new('Camelia sport band', '1490.0') ])
  }

  # Test constructor.

  def test_products_are_assigned
    product_list = SIMPLE_PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list, cart.products
  end

  # Test extremes.

  def test_the_cheapest_product_is_found
    cart = Cart.new SIMPLE_PRODUCTS.values
    assert_same SIMPLE_PRODUCTS[:cheap], cart.min
  end

  def test_the_most_expensive_product_is_found
    cart = Cart.new SIMPLE_PRODUCTS.values
    assert_same SIMPLE_PRODUCTS[:expensive], cart.max
  end

  def test_the_cheapest_product_is_found_by_total
    cart = Cart.new NESTED_PRODUCTS.values
    assert_same NESTED_PRODUCTS[:cheap], cart.min
  end

  def test_the_most_expensive_product_is_found_by_total
    cart = Cart.new NESTED_PRODUCTS.values
    assert_same NESTED_PRODUCTS[:cheap], cart.min
  end

  # Test output.

  def test_sum_is_printed
    cart = Cart.new SIMPLE_PRODUCTS.values
    assert_equal Helper.format_price(cart.sum), cart.to_s
  end

end
