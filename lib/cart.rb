require_relative 'products'
require_relative 'helper'

class Cart

  include Products

  def initialize products
    @products = products
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