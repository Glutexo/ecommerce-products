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

  def test_cart_computes_its_sum
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal sum(product_list), cart.sum
  end

  def test_cart_prints_its_sum
    product_list = PRODUCTS.values
    cart = Cart.new product_list
    assert_equal sum(product_list).to_s('F'), cart.to_s
  end

  def test_cart_finds_the_cheapest_product
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:cheap], cart.min
  end

  def test_cart_finds_the_most_expensive_product
    cart = Cart.new PRODUCTS.values
    assert_same PRODUCTS[:expensive], cart.max
  end

  private
    def big_decimals strings
      strings.map &BigDecimal.method(:new)
    end

    def sum products
      products.sum &:price
    end

end
