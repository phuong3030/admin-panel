class Ecommerce::Asset < Ecommerce::Base
  belongs_to :viewable, polymorphic: true
end
