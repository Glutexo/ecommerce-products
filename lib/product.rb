require 'bigdecimal'
require_relative 'helper'

class Product

  attr_accessor :name
  attr_reader   :price

  def initialize name, price
    self.name  = name
    self.price = price
  end

  def price= price
    @price = price.is_a?(BigDecimal) ? price : BigDecimal.new(price)
  end

  def to_s
    "#{@name} #{Helper.format_price @price}"
  end

end
