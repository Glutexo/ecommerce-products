require 'bigdecimal'
require_relative 'helper'

class Product

  VAT_RATE = BigDecimal.new '0.21' # 21 %

  attr_accessor :name, :price

  def initialize name, price
    self.name  = name
    self.price = price
  end

  def price= price
    @price = price.is_a?(BigDecimal) ? price : BigDecimal.new(price)
  end

  def vat
    @price * VAT_RATE
  end

  def price_with_vat
    @price + vat
  end

  def to_s
    "#{@name} #{Helper.format_price @price}"
  end

end
