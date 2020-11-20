# Cart Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class Cart
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
    @items.push(item)
  end
end
