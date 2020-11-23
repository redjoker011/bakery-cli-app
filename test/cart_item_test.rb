require 'minitest/autorun'
require_relative '../lib/product'
require_relative '../lib/cart_item.rb'

class CartItemTest < Minitest::Test
  def setup
    packs = [{ quantity: 1, price: 1.5 }]
    @product = Product.new({ name: 'Banana Loaf', code: 'BL', product_packs: packs })
  end

  def test_cart_item_creation
    item = ::CartItem.new(product: @product, quantity: 1)

    assert_equal item.product, @product
    assert_equal item.quantity, 1
  end
end
