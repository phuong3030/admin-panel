class Ecommerce::Variant < Ecommerce::Base

  belongs_to :product

  has_many :image, as: :viewable
  has_many :image, :as => :viewable
  has_many :stock_items
  has_many :stock_locations, :through => :stock_items
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :inventory_units

  has_and_belongs_to_many :option_values

end
