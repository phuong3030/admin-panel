class Ecommerce::InventoryUnit < Ecommerce::Base
  belongs_to :variant
  belongs_to :order
  belongs_to :shipment
  belongs_to :return_authorization
end
