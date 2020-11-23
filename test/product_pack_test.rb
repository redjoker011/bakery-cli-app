require_relative '../lib/product_pack.rb'

require 'minitest/autorun'

class ProductPackTest < Minitest::Test
  def setup
    @data = { quantity: 1, price: 1.5 }
  end

  def test_product_pack_creation
    pack = ::ProductPack.new(@data)

    assert_equal @data[:quantity], pack.quantity
    assert_equal @data[:price], pack.price
    assert_equal pack.currency, '€'
  end

  def test_product_pack_creation_with_different_currency
    data_with_currency = @data.merge(currency: '$')
    pack = ::ProductPack.new(data_with_currency)

    assert_equal @data[:quantity], pack.quantity
    assert_equal @data[:price], pack.price
    assert_equal pack.currency, '$'
  end
end
