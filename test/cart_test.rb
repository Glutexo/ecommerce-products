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

  def test_cart_computes_its_sum
    prices = big_decimals ['55990.00', '39990.00']
    products = products prices

    cart = Cart.new products
    assert_equal prices.sum, cart.sum
  end

  def test_cart_prints_its_sum
    prices = big_decimals ['55990.00', '39990.00']
    products = products prices

    cart = Cart.new products
    assert_equal prices.sum.to_s('F'), cart.to_s
  end

  private
    def big_decimals strings
      strings.map &BigDecimal.method(:new)
    end

    def products prices
      prices.map do |price| Product.new 'Product', price end
    end
end
