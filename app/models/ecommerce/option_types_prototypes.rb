class Ecommerce::OptionTypesPrototypes < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :option_type
end
