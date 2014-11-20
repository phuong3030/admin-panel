class Ecommerce::ShippingMethod < Ecommerce::Base
  belongs_to :shipping_category
  belongs_to :zone
end
