require_relative 'price'

class Product

  attr_accessor :name, :price

  def initialize name, price
    self.name  = name
    self.price = price
  end

  def price= price
    @price = Price.new price
  end

  def to_s
    "#{@name} #{@price}"
  end

end
