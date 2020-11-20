# Order Class
# @author Peter John Alvarado <redjoker011@gmail.com>
class Order
  # @attr_reader [Cart] cart object
  attr_reader :cart

  # Constructor
  # @author Peter John Alvarado <redjoker011@gmail.com>
  #
  # @param [Cart] string argument
  #
  # @return [Void] no return value
  def initialize(cart)
    @cart = cart
  end

  def print_summary
    puts 'Printing Order Summary...'

    @cart.items.each do |item|
      puts "#{item.quantity} pcs #{item.product.name} "\
        "@ €#{item.sub_total}"

      item.item_breakdown.each do |breakdown|
        puts "\t#{breakdown[:quantity]} x #{breakdown[:pack_qty]} "\
             "$#{breakdown[:price]}\n"
      end
    end
  end
end
