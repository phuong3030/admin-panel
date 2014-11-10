class FoodStore::Payment < ActiveRecord::Base
  belongs_to :payment_method
  belongs_to :order
end
