# Cart Item Wrapper
# Encapsulate Logic for Cart Item that is not necessary during initialization
# @author Peter John Alvarado <redjoker011@gmail.com>
class CartItemWrapper
  # @attr_reader [CartItem] cart_item cart item object
  # @attr_reader [Array<Hash>] item_breakdown item breakdown list
  attr_reader :item, :item_breakdown, :quantity, :product

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [CartItem] cart item cart item object
  # @return [Void] no return value
  def initialize(cart_item)
    @item = cart_item
    @quantity = cart_item.quantity
    @purchase_qty = cart_item.quantity
    @item_breakdown = []
    @product = cart_item.product
    build_item_breakdown(shift: item.product.croissant?)
  end

  # Item Breakdown Builder
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @return [Array<Hash>] item breakdown list
  def build_item_breakdown(shift: false)
    packs = @product.sorted_packs_desc
    packs.shift if shift
    breakdown(packs) while @purchase_qty != 0
  end

  def sub_total
    total = 0
    @item_breakdown.each do |breakdown|
      total += breakdown[:price]
    end
    total.round(2)
  end

  private

  # Breakdown Item
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [Array<ProductPack>] packs product packs
  #
  # @return [Void] no return value
  def breakdown(packs)
    packs.each_with_index do |pack, idx|
      pack_qty = pack.quantity
      packs_count = @purchase_qty / pack_qty
      remainder = @purchase_qty % pack_qty
      next if idx.positive? && remainder.positive?

      @purchase_qty = remainder

      next if packs_count.zero?

      @item_breakdown << {
        quantity: packs_count,
        pack_qty: pack_qty,
        price: (pack.price * packs_count).round(2)
      }
    end
  end
end
