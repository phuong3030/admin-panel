class Ecommerce::Payments < Ecommerce::Base
  belongs_to :source
  belongs_to :payment_method
end
