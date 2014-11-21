class Ecommerce::Shipment < Ecommerce::Base
  belongs_to :order
  belongs_to :shipping_method
  belongs_to :address

  has_many :inventory_units
end
