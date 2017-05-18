require_relative 'product'

class Cart

  attr_reader :products

  def initialize products
    @products = products
  end

end
