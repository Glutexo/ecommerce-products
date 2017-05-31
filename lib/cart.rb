require_relative 'product'
require_relative 'helper'

class Cart

  attr_accessor :products

  def initialize products
    @products = products
  end

  def sum
    @products.sum &:price
  end

  def sum_vat
    @products.sum &:vat
  end

  def sum_with_vat
    @products.sum &:price_with_vat
  end

  def min
    @products.min_by &:price
  end

  def max
    @products.max_by &:price
  end

  def to_s
    Helper.format_price sum
  end

end