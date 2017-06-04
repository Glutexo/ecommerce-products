module Products

  attr_accessor :products

  def sum
    @products.sum &:total
  end

end
