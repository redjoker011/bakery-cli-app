require_relative './product.rb'

# Seed Products
# @author Peter John Alvarado <redjoker011@gmail.com>
class Seed
  # @attr_reader [Array<Product>] products products list
  attr_reader :products

  def initialize
    @products = seed
  end

  private

  # Seed Data
  # @author Peter John Alvarado <redjoker011@gmail.com>
  # @private
  #
  # @return [Array<Object>] raw products list
  def seed_data
    [
      {
        name: 'Vegemite scroll',
        code: 'VS5',
        packs: [
          { quantity: 3, price: 6.99 },
          { quantity: 5, price: 8.99 }
        ]
      },
      {
        name: 'Blueberry Muffin',
        code: 'MB11',
        packs: [
          { quantity: 2, price: 9.95 },
          { quantity: 5, price: 16.95 },
          { quantity: 8, price: 24.95 }
        ]
      },
      {
        name: 'Croissant',
        code: 'CF',
        packs: [
          { quantity: 3, price: 5.95 },
          { quantity: 5, price: 9.95 },
          { quantity: 9, price: 16.99 }
        ]
      }
    ]
  end

  # Seed Builder
  # @author Peter John Alvarado <redjoker011@gmail.com>
  # @private
  #
  # @return [Array<Product>] products
  def seed
    [].tap do |list|
      seed_data.each do |data|
        product = Product.new(
          name: data[:name],
          code: data[:code],
          product_packs: data[:packs]
        )
        list << product
      end
    end
  end
end
