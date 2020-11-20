require_relative './product_pack.rb'

# Product Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class Product
  # @attr_reader [String] name product name
  # @attr_reader [code] code product code
  # @attr_reader [ProductPack] packs product packs
  attr_reader :name, :code, :packs

  def initialize(name:, code:, product_packs:)
    @name = name
    @code = code
    @packs = build_packs(product_packs)
  end

  private

  # Product Packs Builder
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [Array<Object>] packs list of product packs data
  #
  # @return [Array<ProductPack>] product packs
  def build_packs(packs)
    [].tap do |list|
      packs.each do |pack|
        list << ProductPack.new(
          quantity: pack[:quantity],
          price: pack[:price]
        )
      end
    end
  end
end
