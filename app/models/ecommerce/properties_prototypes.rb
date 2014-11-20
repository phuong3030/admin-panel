class Ecommerce::PropertiesPrototypes < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :property
end
