require_relative '../lib/product'
require_relative '../lib/products'
require 'test/unit'

class ProductList

  include Products

  def initialize products
    @products = products
  end

end

class ProductsTest < Test::Unit::TestCase

  def test_simple_sum_is_computed
    product_list = ProductList.new [ Product.new('MacBook Pro', '55990.99'),
                                 Product.new('Mac Pro', '95990.90'),
                                 Product.new('iMac', '39990.00') ]
    test_sum_is_computed product_list
  end

  def test_tree_sum_is_computed
    product_list = ProductList.new [ Product.new('iPhone 7',
                                             '21190.00',
                                             [ Product.new('Smart battery case', '2990.00'),
                                               Product.new('Lightning to 3.5 mm headphone jack adapter', '279.90') ]),
                                 Product.new('iMac', '39990.00') ]
    test_sum_is_computed product_list
  end

  def test_empty_sum_is_computed
    product_list = ProductList.new []
    test_sum_is_computed product_list
  end

  private
    def test_sum_is_computed product_list
      assert_equal BigDecimal.new(product_list.products.map(&:total).sum),
                   product_list.sum
    end

end
