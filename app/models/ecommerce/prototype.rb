class Ecommerce::Prototype < Ecommerce::Base

  has_and_belongs_to_many :properties
  has_and_belongs_to_many :option_types

end
