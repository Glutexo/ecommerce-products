require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  PRODUCTS = [ Product.new('Smart battery case', '2990.00'),
               Product.new('Lightning to 3.5 mm headphone jack adapter', '279.90') ]

  # Test value conversion.

  def test_integer_price_is_converted_to_big_decimal
    # Floats not tested as one does not simply create a BigDecimal from a float.
    product = Product.new 'MacBook Pro', 49999
    assert_equal BigDecimal.new('49999'), product.price
  end

  def test_string_price_is_converted_to_big_decimal
    product = Product.new 'MacBook Pro', '49999.99'
    assert product.price.is_a? BigDecimal
    assert_equal BigDecimal.new('49999.99'), product.price
  end

  def test_big_decimal_price_is_not_converted
    price = BigDecimal.new '49999.99'
    product = Product.new 'MacBook Pro', price
    assert_same price, product.price
  end

  def test_products_are_assigned
    product = Product.new 'MacBook Pro', '49999.99', PRODUCTS
    assert_equal PRODUCTS, product.products
  end

  # Test computations.

  def test_total_is_computed
    product = Product.new 'MacBook Pro', '49999.99', PRODUCTS
    assert_equal product.price + product.sum, product.total
  end

  # Test output.

  def test_simple_name_is_printed
    product = Product.new 'MacBook Pro', '49999.90'
    test_name_and_price_are_printed product
  end

  def test_complex_name_is_printed
    object_with_name = Object.new
    def object_with_name.to_s
      'MacBook Pro'
    end

    # Kind of testing Ruby internals here, but also making sure there is nothing
    # fishy going on.
    product = Product.new object_with_name, '49999.99'
    test_name_and_price_are_printed product
  end

  def test_prices_are_printed
    product = Product.new 'iPhone 7', '21190.00', PRODUCTS
    test_name_and_price_are_printed product
  end

  def test_subproducts_are_printed
    base_product = Product.new 'iPhone 7', '21190.00'
    subproducts    = [ Product.new('Smart battery case', '2990.00'),
                       Product.new('Lightning to 3.5 mm headphone jack adapter', '279.90') ]
    nested_product = Product.new base_product.name, base_product.price, subproducts

    lines = [ product_first_line(nested_product),
              subproducts.map { |product| prefix product.to_s, 1 }
    ].flatten
    assert_equal lines.join("\n"), nested_product.to_s
  end

  def test_subsubproducts_are_printed
    first_subsubproducts  = [ Product.new('Smart battery case', '2990.00'),
                              Product.new('Lightning to 3.5 mm headphone jack adapter', '279.90') ]
    first_subproduct = Product.new 'iPhone 7',
                                   '21190.00',
                                   first_subsubproducts

    second_subsubproducts  = [ Product.new('Magnetic charging cable', '899.00'),
                               Product.new('Camelia sport band', '1490.00') ]
    second_subproduct = Product.new 'Apple Watch Series 2',
                                    '8290.00',
                                    second_subsubproducts

    nested_product = Product.new "iPhone + Apple Watch",
                                 '0.00',
                                 [first_subproduct, second_subproduct]

    lines = [ product_first_line(nested_product),
              prefix(product_first_line(first_subproduct), 1),
              first_subsubproducts.map { |product| prefix product.to_s, 2 },
              prefix(product_first_line(second_subproduct), 1),
              second_subsubproducts.map { |product| prefix product.to_s, 2 }
    ].flatten
    assert_equal lines.join("\n"), nested_product.to_s
  end

  private
    def test_name_and_price_are_printed product
      formatted_price = Helper.format_price product.price
      formatted_sum   = Helper.format_price product.sum
      assert_equal "#{product.name} #{formatted_price} #{formatted_sum}",
                   product_first_line(product.to_s)
    end

    def product_first_line product
      product.to_s.split("\n").first
    end

    def prefix string, level
      Product::NESTED_PREFIX * level + string
    end

end
