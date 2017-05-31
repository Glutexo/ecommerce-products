require 'bigdecimal'

class PriceWithVat

  VAT_RATE = BigDecimal.new '0.21' # 21 %

  def initialize price
    @price = self.class.amount price
  end

  def without_vat
    @price
  end

  def vat
    @price * VAT_RATE
  end

  def with_vat
    @price + vat
  end

  def == other
    without_vat == other.without_vat
  end

  def to_s
    "#{Helper.format_price without_vat} #{Helper.format_price vat}"
  end

  def self.sum prices
    self.new prices.sum &method(:amount)
  end

  private

    def self.amount price
      BigDecimal.new price.is_a?(self) ? price.without_vat : price
    end

end
