class Ecommerce::PaymentMethod < Ecommerce::Base

  has_many :payments
  has_many :orders, :through => :payments

end
