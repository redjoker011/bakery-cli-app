require 'minitest/autorun'
require_relative '../lib/product'
require_relative '../lib/cart_item.rb'
require_relative '../lib/cart.rb'

class CartTest < Minitest::Test
  def setup
    packs = [{ quantity: 3, price: 1.5 }]
    @product = Product.new({ name: 'Banana Loaf', code: 'BL', product_packs: packs })
  end

  def test_add_item_to_cart
    cart = Cart.new
    item = ::CartItem.new(product: @product, quantity: 3)
    cart.add(item)
    assert_equal cart.items.length, 1
  end

  def test_add_item_to_cart_with_invalid_quantity
    cart = Cart.new
    item = ::CartItem.new(product: @product, quantity: 1)
    assert_raises Cart::InvalidQuantity do
      cart.add(item)
    end
  end
end
