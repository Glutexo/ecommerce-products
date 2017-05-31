require_relative 'price_with_vat'
require_relative 'helper'

class Product

  attr_accessor :name

  def initialize name, price
    self.name  = name
    self.price = price
  end

  def price= price
    @price = PriceWithVat.new price
  end

  def price
    @price.price
  end

  def vat
    @price.vat
  end

  def price_with_vat
    @price.price_with_vat
  end

  def to_s
    "#{@name} #{@price}"
  end

end
