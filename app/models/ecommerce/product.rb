class Ecommerce::Product < Ecommerce::Base
  belongs_to :tax_category
  belongs_to :shipping_category

  has_many :variants, :dependent => :destroy
  has_many :products_properties
  has_many :properties, :through => :products_properties
  has_many :products_option_types
  has_many :option_types, :through => :products_option_types

  has_and_belongs_to_many :taxons
end
