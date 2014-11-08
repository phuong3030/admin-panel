module FoodStore
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many(
      :products, 
      :class_name => "FoodStore::Product", 
      :dependent => :destroy
    )

    accepts_nested_attributes_for :products, :allow_destroy => true
  end
end
