require 'bigdecimal'

class PriceWithVat

  VAT_RATE = BigDecimal.new '0.21' # 21 %

  attr_reader :price

  def initialize price
    self.price = price
  end

  def price= price
    @price = BigDecimal.new price
  end

  def vat
    @price * VAT_RATE
  end

  def price_with_vat
    @price + vat
  end

  def to_s
    "#{Helper.format_price @price} #{Helper.format_price vat}"
  end

end
