# Order Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class Order
  # @attr_reader [Cart] cart object
  attr_reader :cart

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [Cart] cart argument
  #
  # @return [Void] no return value
  def initialize(cart)
    @cart = cart
  end

  # Order Total Amount
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @return [Float] total
  def total
    cart.items.sum(&:sub_total).round(2)
  end

  def print_summary
    puts "\nPrinting Order Summary...\n\n"

    @cart.items.each do |item|
      puts "#{item.quantity} pcs #{item.product.name} "\
        "@ €#{item.sub_total}"

      item.item_breakdown.each do |breakdown|
        puts "\t#{breakdown[:quantity]} x #{breakdown[:pack_qty]} "\
             "€#{breakdown[:price_per_item]}\n"
      end
    end

    puts '==========================================='
    puts "Grand Total: €#{total}"
  end
end
