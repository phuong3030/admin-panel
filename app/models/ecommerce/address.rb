class Ecommerce::Address < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
end
