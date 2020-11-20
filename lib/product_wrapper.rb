# Product Wrapper Class
# Product Decorator to handle top level logic for Product Object
# @author Peter John Alvarado <redjoker011@gmail.com>
class ProductWrapper
  NotFound = Class.new(StandardError)

  # @attr_reader [Array<Product>] products products list
  attr_reader :products

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [Array<Product>] products product list
  #
  # @return [Void] no return value
  def initialize(products)
    @products = products
  end

  # Method for finding product object
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [String] name product name
  #
  # @return [Product] product object
  def find(name)
    product = products.detect { |prod| prod.name == name }
    raise NotFound, 'Product Not Found' unless product
  end
end
