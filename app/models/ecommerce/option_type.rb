class Ecommerce::OptionType < Ecommerce::Base

  has_many :option_values

  has_many :products_option_types
  has_many :products, :through => :products_option_types

  has_and_belongs_to_many :prototypes

end
