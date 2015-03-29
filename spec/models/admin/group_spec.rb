require 'rails_helper'

RSpec.describe Admin::Group, type: :model do

  context 'associations and index' do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:users) }
  end

  context "validators" do
    it { should validate_presence_of(:name) }
  end

  context 'role instance method' do
    let(:group) { FactoryGirl.create(:group_admin) }
    subject { group }

    it 'can get list of role name' do
      subject.role_array[0].should be_an_instance_of String
    end

    it 'can check role of group' do
      subject.role?(:admin).should be_truthy
    end

    it 'can add new role' do
    end
    it { should respond_to(:remove_role) }
  end
end
