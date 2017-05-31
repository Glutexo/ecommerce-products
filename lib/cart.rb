require_relative 'product'
require_relative 'helper'

class Cart

  attr_accessor :products

  def initialize products
    @products = products
  end

  def sum
    PriceWithVat.new @products.sum &method(:price)
  end

  def min
    @products.min_by &method(:price)
  end

  def max
    @products.max_by &method(:price)
  end

  def to_s
    sum.to_s
  end

  private
    def price product
      product.price.without_vat
    end

end