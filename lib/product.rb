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
      @price = price.to_f
    end

  end

end