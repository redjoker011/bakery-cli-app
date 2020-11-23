require 'minitest/autorun'
require_relative '../lib/product.rb'

class ProductTest < Minitest::Test
  def setup
    packs = [{ quantity: 1, price: 1.5 }]
    @product_data = { name: 'Banana Loaf', code: 'BL', product_packs: packs }
  end

  def test_product_creation
    product = ::Product.new(@product_data)

    assert_equal @product_data[:name], product.name
    assert_equal @product_data[:code], product.code
    assert_equal product.packs.length, 1
  end
end
