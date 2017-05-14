require_relative 'config'

module ECommerce

  class Helper

    class << self

      def format_price price
        rounded   = price.to_f.round PRICE_PRECISION
        localized = LOCALE.localize(rounded)

        separator = LOCALE.number_decimal
        parts     = localized.split(separator)
        if parts[1].length < PRICE_PRECISION
          missing_zeroes = PRICE_PRECISION - parts[1].length
          parts[1] += '0' * missing_zeroes
        end

        "#{parts.join(separator)} #{CURRENCY}"
      end

    end

  end

end