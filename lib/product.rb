require 'bigdecimal'
require_relative 'helper'
require_relative 'products'

class Product

  include Products

  attr_accessor :name, :price

  def initialize name, price, products = []
    @name      = name
    @products  = products

    self.price = price
  end

  def price= price
    @price = price.is_a?(BigDecimal) ? price : BigDecimal.new(price)
  end

  def total
    @price + sum
  end

  def to_s
    "#{@name} #{Helper.format_price @price}"
  end

end
