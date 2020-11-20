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

  # Get Product Packs Minimum Quantity
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @return [Integer] minimum purchase quantity
  def min_purchase_quantity
    packs.map(&:quantity).min
  end

  # Sort Product Packs in descending Order
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @return [Array<Pack>] product list
  def sorted_packs_desc
    @packs.sort_by(&:quantity).reverse unless @packs.empty?
  end

  # Product Type Checker
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @return [Boolean]
  def croissant?
    @code == 'CF'
  end

  private

  # Product Packs Builder
  # @author Peter John Alvarado <redjoker011@gmail.com>
  # @private
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
