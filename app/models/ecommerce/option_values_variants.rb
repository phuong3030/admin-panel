class Ecommerce::OptionValuesVariants < ActiveRecord::Base
  belongs_to :variant
  belongs_to :option_value
end
