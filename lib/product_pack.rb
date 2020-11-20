# Product Pack
# @author Peter John Alvarado <redjoker011@gmail.com>
class ProductPack
  attr_reader :quantity, :price, :currency

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [String] quantity product quantity
  # @param [Float] price product price
  # @param [String] currency product price currency
  #
  # @return [Void] no return value
  def initialize(quantity:, price:, currency: '€')
    @quantity = quantity
    @price = price
    @currency = currency
  end
end
