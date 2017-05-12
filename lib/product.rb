require_relative 'config'

module ECommerce

  class Product

    include R18n::Helpers

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
      price_formatted = l @price
      "#{@name} (#{price_formatted} #{CURRENCY})"
    end

  end

end