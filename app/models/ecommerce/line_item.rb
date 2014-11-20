class Ecommerce::LineItem < Ecommerce::Base
  belongs_to :order
  belongs_to :variant
end
