class Ecommerce::Order < Ecommerce::Base

  belongs_to :user
  belongs_to :bill_address
  belongs_to :ship_address
  belongs_to :shipping_method

  has_many :line_items
  has_many :variants, :through => :line_items
  has_many :payments
  has_many :payment_methos, :through => :payments
  has_many :shipping_rates
  has_many :shipping_methods, :through => :shipping_rates

end
