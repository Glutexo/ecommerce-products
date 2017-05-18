class Helper

  class << self

    def format_price big_decimal
      big_decimal.to_s 'F'
    end

  end

end
