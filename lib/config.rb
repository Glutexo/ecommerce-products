require 'r18n-core'

module ECommerce

  PRICE_PRECISION = 2
  CURRENCY        = 'Kč'
  LOCALE          = :cs

end

R18n.set ECommerce::LOCALE
