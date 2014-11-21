class Ecommerce::OptionValuesVariants < Ecommerce::Base
  belongs_to :variant
  belongs_to :option_value
end
