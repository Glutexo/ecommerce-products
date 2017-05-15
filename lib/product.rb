require 'bigdecimal'

class Product

  CURRENCY = 'Kč'

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
    "#{@name} (#{@price.to_s('F')} #{CURRENCY})"
  end

end
