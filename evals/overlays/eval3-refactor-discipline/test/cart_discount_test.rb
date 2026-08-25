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

  def test_save20_takes_twenty_percent_off
    @cart.apply_code("SAVE20")
    assert_in_delta 34.00, @cart.total
  end

  def test_fiver_takes_five_off
    @cart.apply_code("FIVER")
    assert_in_delta 37.50, @cart.total
  end

  def test_fiver_never_drops_total_below_zero
    cart = Cart.new
    cart.add("washer", 0.75)
    cart.apply_code("FIVER")
    assert_equal 0, cart.total
  end

  def test_unknown_code_raises
    assert_raises(Cart::UnknownCode) { @cart.apply_code("BOGUS") }
  end
end
