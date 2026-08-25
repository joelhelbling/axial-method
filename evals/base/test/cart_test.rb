require "minitest/autorun"
require "cart"

class CartTest < Minitest::Test
  def setup
    @cart = Cart.new
  end

  def test_new_cart_has_no_items
    assert_equal 0, @cart.item_count
  end

  def test_add_increases_item_count
    @cart.add("chisel", 24.00)
    assert_equal 1, @cart.item_count
  end

  def test_total_sums_item_prices
    @cart.add("chisel", 24.00)
    @cart.add("mallet", 18.50)
    assert_in_delta 42.50, @cart.total
  end

  def test_empty_cart_total_is_zero
    assert_equal 0, @cart.total
  end
end
