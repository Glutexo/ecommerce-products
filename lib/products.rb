require_relative 'product'

module Products

  attr_accessor :products

  def sum
    @products.sum &:price
  end

end
