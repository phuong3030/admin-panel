class FoodStore::Orders < ActiveRecord::Base
  belongs_to :customer
  belongs_to :supplier
  belongs_to :shipping_method
  belongs_to :bill_address
  belongs_to :ship_address
end
