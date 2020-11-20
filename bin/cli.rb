require 'tty-prompt'
require_relative '../lib/seed.rb'
require_relative '../lib/cart_item'
require_relative '../lib/cart'
require_relative '../lib/order'

# Initialize TTY Lib
# @author Peter John Alvarado <redjoker011@gmail.com>
@prompt = TTY::Prompt.new
# Method for handling purchase flow
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def start_purchase
  cart = Cart.new
  order = Order.new(cart)
  ordering_process(cart: cart, order: order)
  order.print_summary
rescue StandardError => e
  puts e.message
end

def ordering_process(cart:, order:)
  product_code = product_selection
  qty = ask_quantity

  product = PRODUCT_WRAPPER.find(product_code)
  item = CartItem.new(product: product, quantity: qty)
  cart.add(item)
  ordering_process(cart: cart, order: order) if @prompt.yes?('Order More Products ?')
end

# Build Product Selection Options
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Array<Hash>] product options
def product_opts
  [].tap do |opts|
    PRODUCT_WRAPPER.products.each do |product|
      opts << { label: product.name, val: product.code }
    end
  end
end

# Handle Product Selection
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def product_selection
  @prompt.select('Choose Product') do |menu|
    product_opts.each do |opts|
      menu.choice opts[:label], opts[:val]
    end
  end
end

# Handle Quantity Input
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def ask_quantity
  @prompt.ask('Enter Quantity', convert: :integer) do |q|
    q.required true
    q.validate(/\d/, 'Invalid Quantity')
  end
end

p 'Initializing App Please wait...'
p 'Seeding Products...'
PRODUCT_WRAPPER = Seed.new.products

start_purchase
