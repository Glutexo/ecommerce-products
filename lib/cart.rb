require_relative 'product'
require_relative 'helper'

class Cart

  attr_accessor :products

  def initialize products
    @products = products
  end

  def sum_price
    @products.sum { |product| product.price.without_vat }
  end

  def sum_vat
    @products.sum { |product| product.price.vat }
  end

  def sum_price_with_vat
    @products.sum { |product| product.price.with_vat }
  end

  def min
    @products.min_by { |product| product.price.without_vat }
  end

  def max
    @products.max_by { |product| product.price.without_vat }
  end

  def to_s
    PriceWithVat.new(sum_price).to_s
  end

end