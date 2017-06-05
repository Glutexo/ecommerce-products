require 'bigdecimal'
require_relative 'helper'
require_relative 'products'

class Product

  NESTED_PREFIX = '  '

  include Products

  attr_accessor :name, :price

  def initialize name, price, products = []
    @name      = name
    @products  = products

    self.price = price
  end

  def price= price
    @price = price.is_a?(BigDecimal) ? price : BigDecimal.new(price)
  end

  def total
    @price + sum
  end

  def to_s
    ([to_s_self] + to_s_products.flatten).join "\n"
  end

  private
    def to_s_self
      [ @name,
        Helper.format_price(@price),
        Helper.format_price(sum) ].join ' '
    end

    def to_s_products
      @products.map(&:to_s).map &method(:prefix_all_lines)
    end

    def prefix_all_lines string
      string.split("\n").map { |line| NESTED_PREFIX + line }.join("\n")
    end

end
