require 'minitest/autorun'
require_relative '../lib/product'
require_relative '../lib/cart_item.rb'
require_relative '../lib/cart.rb'
require_relative '../lib/order.rb'

class OrderTest < Minitest::Test
  def setup
    packs = [{ quantity: 3, price: 1.5 }]
    @product = Product.new({ name: 'Banana Loaf', code: 'BL', product_packs: packs })
    @item = ::CartItem.new(product: @product, quantity: 3)
    @cart = Cart.new
    @cart.add(@item)
    @order = Order.new(@cart)
  end

  def test_order_creation
    assert_equal @order.cart, @cart
  end

  def test_order_total_calculation
    total = @cart.items.sum(&:sub_total).round(2)
    assert_equal @order.total, total
  end
end
