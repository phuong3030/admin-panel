class FoodStore::Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category, :class_name => "FoodStore::Category"
end
