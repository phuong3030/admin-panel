class Ecommerce::ShippingCategory < Ecommerce::Base
  has_many :products 
  has_many :shipping_methods
end
