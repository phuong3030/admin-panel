class Admin::Function < ActiveRecord::Base
  belongs_to :functionable, polymorphic: true
  has_ancestry
end
