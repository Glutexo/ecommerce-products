require 'bigdecimal'

class Price

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
    "#{self.class.format without_vat} #{self.class.format vat}"
  end

  def self.sum prices
    self.new prices.sum &method(:amount)
  end

  def self.format big_decimal
    big_decimal.to_s 'F'
  end

  private

    def self.amount price
      BigDecimal.new price.is_a?(self) ? price.without_vat : price
    end

end
