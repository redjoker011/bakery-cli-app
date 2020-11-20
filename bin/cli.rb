require 'tty-prompt'
require_relative '../lib/seed.rb'

# Initialize TTY Lib
# @author Peter John Alvarado <redjoker011@gmail.com>
@prompt = TTY::Prompt.new

# Method for handling purchase flow
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def start_purchase
  product_selection
  ask_quantity
end

# Build Product Selection Options
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def product_opts
  PRODUCTS.map(&:name)
end

# Handle Product Selection
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def product_selection
  @prompt.select('Choose Product', product_opts)
end

# Handle Quantity Input
# @author Peter John Alvarado <redjoker011@gmail.com>
#
# @return [Void] no return value
def ask_quantity
  @prompt.ask('Enter Quantity') do |q|
    q.required true
    q.validate(/\d/, 'Invalid Quantity')
  end
end

p 'Initializing App Please wait...'
p 'Seeding Products...'
PRODUCTS = Seed.new.products

start_purchase
