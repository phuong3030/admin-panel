require 'rails_helper'

RSpec.describe Admin::Role, type: :model do

  context 'associations and index' do
    it { should have_and_belong_to_many(:groups) }
    it { should have_and_belong_to_many(:functions) }
    it { should have_many(:functions_roles) }
    it { should have_many(:sidebars) }
    it { should have_many(:menus) }
  end

  context 'validators' do
    it { should validate_uniqueness_of(:name) }
  end

end
