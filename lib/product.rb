require_relative 'config'
require_relative 'helper'

module ECommerce

  class Product

    attr_accessor :name, :price

    def initialize name, price
      @name  = name
      @price = price
    end

    def to_s
      "#{@name} (#{Helper.format_price(@price)})"
    end

  end

end