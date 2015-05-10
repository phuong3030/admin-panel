require 'rails_helper'

RSpec.describe Admin::Function, type: :model do
  let(:parent) { FactoryGirl.create(:sidebar, name: 'parent') }
  let(:child) { FactoryGirl.create(:sidebar, name: 'child', parent_id: parent.id) }

  context 'Validators and index' do
    it { should have_and_belong_to_many(:roles) }
  end

  context 'instance methods' do
  end

  context 'class methods' do
    it 'can convert ancestry to json tree' do
      arranged_sidebars = Admin::Function.arrange_nodes([parent, child])
      json = Admin::Function.json_tree(arranged_sidebars)
      json.should == [
        { 
          name: 'parent', 
          url: parent.url,
          icon: parent.icon, 
          id: parent.id, 
          children: [ 
            { 
              name: 'child', 
              url: child.url,
              icon: child.icon,
              id: child.id,
              children: []
            }
          ]
        }
      ]
    end
  end
end
