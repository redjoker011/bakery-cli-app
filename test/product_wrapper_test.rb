require 'minitest/autorun'
require_relative '../lib/product.rb'
require_relative '../lib/product_wrapper.rb'

class ProductWrapperTest < Minitest::Test
  def setup
    packs = [{ quantity: 1, price: 1.5 }]
    @products = [
      Product.new({ name: 'Banana Loaf', code: 'BL', product_packs: packs }),
      Product.new({ name: 'Banana Cake', code: 'BC', product_packs: packs })
    ]
  end

  def test_product_wrappper_creation
    wrapper = ::ProductWrapper.new(@products)

    assert_equal wrapper.products.length, 2
  end

  def test_find_product
    wrapper = ProductWrapper.new(@products)

    refute_nil wrapper.find('BL')
  end

  def test_invalid_product_code
    wrapper = ProductWrapper.new(@products)
    assert_raises ProductWrapper::NotFound do
      refute_nil wrapper.find('BLLL')
    end
  end
end
