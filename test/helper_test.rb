require_relative '../lib/helper'
require 'test/unit'

class HelperTest < Test::Unit::TestCase

  def test_price_is_localized
    assert_equal '1 234,56 Kč', ECommerce::Helper.format_price(1234.56)
  end

  def test_currency_is_added
    assert_equal '1,23 Kč', ECommerce::Helper.format_price(1.23)
  end

  def test_price_is_rounded
    assert_equal '1,23 Kč', ECommerce::Helper.format_price(1.225)
  end

  def test_zeroes_are_added
    assert_equal '1,20 Kč', ECommerce::Helper.format_price(1.2)
  end

  def test_zeroes_are_added_after_rounding
    assert_equal '1,20 Kč', ECommerce::Helper.format_price(1.199)
  end

  def test_zeroes_are_added_for_integers
    assert_equal '1,00 Kč', ECommerce::Helper.format_price(1)
  end

end
