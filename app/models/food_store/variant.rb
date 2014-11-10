class FoodStore::Variant < ActiveRecord::Base
  belongs_to :product
end
