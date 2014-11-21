class Ecommerce::ShippingMethod < Ecommerce::Base

  belongs_to :shipping_category
  belongs_to :zone

  has_many :shipping_rates
  has_many :shipments, :through => :shipping_rates

end
