require_relative 'config'
require_relative 'helper'

module ECommerce

  class Product

    attr_reader :name, :price

    def initialize name, price
      self.name  = name
      self.price = price
    end

    def name= name
      @name = name.to_s
    end

    def price= price
      @price = price.to_f.round PRICE_PRECISION
    end

    def to_s
      "#{@name} (#{Helper.format_price(@price)})"
    end

  end

end