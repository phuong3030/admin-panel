class Ecommerce::Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill_address
  belongs_to :ship_address
  belongs_to :shipping_method
end
