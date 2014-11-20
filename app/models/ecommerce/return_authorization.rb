class Ecommerce::ReturnAuthorization < ActiveRecord::Base
  belongs_to :order
end
