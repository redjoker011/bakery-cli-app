# Cart Item Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class CartItem
  # @attr_reader [Product] product product object
  # @attr_reader [Integer] quantity product quantity
  attr_reader :product, :quantity

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  # @param [Product] product product object
  # @param [Integer] quantity product quantity
  #
  # @return [Void] no return value
  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity
  end
end
