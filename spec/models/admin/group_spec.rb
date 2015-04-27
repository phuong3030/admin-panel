require 'rails_helper'

RSpec.describe Admin::Group, type: :model do

  context 'associations and index' do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:users) }
    it { should have_many(:groups_roles) }
  end

  context "validators" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context 'role instance method' do
    let(:group) { FactoryGirl.create(:admin_group) }
    subject { group }

    it 'can get list of role name' do
      subject.role_array[0].should be_an_instance_of String
    end

    it 'can check role of group' do
      subject.role?(subject.role_array[0].to_sym).should be_truthy
    end

    it 'can add new role' do
      FactoryGirl.create(:role, name: 'moderator')
      expect { subject.add_role('moderator') }.to change(subject.groups_roles, :count).by(1)
    end

    it 'can remove role' do
      expect { subject.remove_role(subject.role_array[0]) }.to change(subject.groups_roles, :count).from(1).to(0)
    end

    # Just check the Admin::Function.json_tree method has been called
    # The result of json_tree function is tested in function spec
    it 'can get func by role' do
      Admin::Function.should_receive(:json_tree)

      group.get_func_by_role('sidebars')
    end
  end
end
