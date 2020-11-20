# Cart Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class Cart
  InvalidQuantity = Class.new(StandardError)

  # @attr_reader [Array<Order>] items cart items
  attr_reader :items

  def initialize
    @items = []
  end

  # Add Item to Cart
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [CartItem] item cart item
  #
  # @return [Void] no return value
  def add(item)
    product = item.product
    qty = item.quantity
    min_purchase_quantity = product.min_purchase_quantity

    if qty < min_purchase_quantity
      raise InvalidQuantity, "Minimum quantity for this product is #{min_purchase_quantity}"
    end

    @items.push(item)
  end
end
