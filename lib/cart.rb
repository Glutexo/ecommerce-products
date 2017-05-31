require_relative 'product'
require_relative 'helper'

class Cart

  attr_accessor :products

  def initialize products
    @products = products
  end

  def sum
    PriceWithVat.new @products.sum { |product| product.price.without_vat }
  end

  def min
    @products.min_by { |product| product.price.without_vat }
  end

  def max
    @products.max_by { |product| product.price.without_vat }
  end

  def to_s
    sum.to_s
  end

end