require_relative '../lib/product'
require 'test/unit'

class ProductTest < Test::Unit::TestCase

  # Test constructor.

  def test_name_is_assigned
    name = 'MacBook Pro'
    product = Product.new name, BigDecimal.new('49999.99')
    assert_equal name, product.name
  end

  def test_price_is_assigned
    price = BigDecimal.new '49999.99'
    product = Product.new 'MacBook Pro', price
    assert_equal price, product.price
  end

  # Test computations.

  def test_vat_is_computed
    price_with_vat = PriceWithVat.new '49999.99'
    product = Product.new 'MacBook Pro', price_with_vat.price
    assert_equal price_with_vat.vat, product.vat
  end

  def test_price_with_vat_is_computed
    price_with_vat = PriceWithVat.new '49999.99'
    product = Product.new 'MacBook Pro', price_with_vat.price
    assert_equal price_with_vat.price_with_vat, product.price_with_vat
  end

  # Test output.

  def test_printing
    name = 'MacBook Pro'
    price_with_vat = PriceWithVat.new '49999.99'
    product = Product.new name, price_with_vat.price
    assert_equal "#{name} #{price_with_vat}", product.to_s
  end

end
