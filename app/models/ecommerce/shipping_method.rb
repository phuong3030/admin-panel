class Ecommerce::ShippingMethod < ActiveRecord::Base
  belongs_to :shipping_category
  belongs_to :zone
end
