module Products

  attr_accessor :products

  def sum
    BigDecimal.new @products.sum &:total
  end

end
