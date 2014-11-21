class Ecommerce::Property < Ecommerce::Base

  has_many :products_properties
  has_many :products, :through => :products_properties

  has_and_belongs_to_many :prototypes

end
