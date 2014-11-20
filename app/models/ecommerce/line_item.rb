class Ecommerce::LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :variant
end
