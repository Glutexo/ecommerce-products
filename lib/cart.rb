require_relative 'product'

class Cart

  attr_reader :products

  def initialize products
    @products = products
  end

  def sum
    @products.map(&:price).sum
  end

  def to_s
    sum.to_s 'F'
  end

end