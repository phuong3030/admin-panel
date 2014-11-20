class Ecommerce::Address < Ecommerce::Base
  belongs_to :state
  belongs_to :country
end
