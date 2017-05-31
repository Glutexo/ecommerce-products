require_relative '../lib/cart'
require 'test/unit'

class CartTest < Test::Unit::TestCase

  PRODUCTS = { halfway:   Product.new('MacBook Pro', '55990.99'),
               expensive: Product.new('Mac Pro', '95990.90'),
               cheap:     Product.new('iMac', '39990.00') }


  def test_cart_has_products
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list, cart.products
  end

  # Test sums.

  def test_cart_computes_sum_of_product_prices
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list.sum { |product| product.price.without_vat }, cart.sum_price
  end

  def test_cart_computes_sum_of_product_vats
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list.sum { |product| product.price.vat }, cart.sum_vat
  end

  def test_cart_computes_sum_of_product_prices_with_vat
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal product_list.sum { |product| product.price.with_vat }, cart.sum_price_with_vat
  end

  # Test extremes.

  def test_cart_finds_the_cheapest_product
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:cheap], cart.min
  end

  def test_cart_finds_the_most_expensive_product
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:expensive], cart.max
  end

  # Test output.

  def test_cart_prints_sum
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal "#{Helper.format_price(cart.sum_price)} #{Helper.format_price(cart.sum_vat)}", cart.to_s
  end

end
