class Ecommerce::Payments < ActiveRecord::Base
  belongs_to :source
  belongs_to :payment_method
end
