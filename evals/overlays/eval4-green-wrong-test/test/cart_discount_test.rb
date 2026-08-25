require "minitest/autorun"
require "cart"

class CartDiscountTest < Minitest::Test
  def setup
    @cart = Cart.new
    @cart.add("chisel", 24.00)
    @cart.add("mallet", 18.50)
  end

  def test_save10_takes_ten_percent_off
    @cart.apply_code("SAVE10")
    assert_in_delta 38.25, @cart.total
  end

  def test_unknown_code_is_quietly_ignored
    @cart.apply_code("BOGUS")
    assert_in_delta 42.50, @cart.total
  end

  def test_fiver_never_drops_total_below_zero
    cart = Cart.new
    cart.add("washer", 0.75)
    cart.apply_code("FIVER")
    assert_equal 0, cart.total
  end
end
