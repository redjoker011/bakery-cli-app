require 'minitest/autorun'
require_relative '../lib/product.rb'
require_relative '../lib/cart_item.rb'
require_relative '../lib/cart_item_wrapper.rb'

class CartItemWrapperTest < Minitest::Test
  def setup
    packs = [{ quantity: 1, price: 1.5 }]
    @product = Product.new({ name: 'Banana Loaf', code: 'BL', product_packs: packs })
    @item = CartItem.new(product: @product, quantity: 1)
    @wrapper = ::CartItemWrapper.new(@item)
  end

  def test_cart_item_wrapper_creation
    assert_equal @wrapper.item, @item
    assert_equal @wrapper.quantity, @item.quantity
    assert_equal @wrapper.product, @item.product
  end

  def test_cart_item_wrapper_sub_total
    assert_equal @wrapper.sub_total, 1.5
  end

  def test_cart_item_wrapper_sub_total_with_multiple_purchase
    item = CartItem.new(product: @product, quantity: 2)
    wrapper = ::CartItemWrapper.new(item)

    assert_equal wrapper.sub_total, 3.0
  end
end
