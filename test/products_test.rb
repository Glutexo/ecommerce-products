require_relative '../lib/products'
require 'test/unit'

class ProductList

  include Products

  def initialize products
    @products = products
  end

end

class ProductsTest < Test::Unit::TestCase

  PRODUCTS = [ Product.new('MacBook Pro', '55990.99'),
               Product.new('Mac Pro', '95990.90'),
               Product.new('iMac', '39990.00') ]

  def test_sum_is_computed
    products = ProductList.new PRODUCTS
    assert_equal PRODUCTS.sum(&:price), products.sum
  end

end
