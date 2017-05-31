require_relative 'price_with_vat'
require_relative 'helper'

class Product

  attr_accessor :name, :price

  def initialize name, price
    self.name  = name
    self.price = price
  end

  def price= price
    @price = PriceWithVat.new price
  end

  def to_s
    "#{@name} #{@price}"
  end

end
