require 'rails_helper'

describe Admin::User, :type => :model do

  context 'association and index' do
    it { should belong_to(:group) }
    it { should have_db_index(:email) }
    it { should have_db_index(:bill_address_id) }
    it { should have_db_index(:ship_address_id) }
    it { should have_db_index(:group_id) }
    it { should have_db_index(:reset_password_token) }
  end

  context "validators" do
    let(:no_name_user) { 
      FactoryGirl.build(
        :user, 
        firstname: '', 
        lastname: '', 
        email: 'aga'
      ) 
    }
    subject { no_name_user }

    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:email) }
    it { should allow_value('admin@email.com').for(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end

  context 'has right instance method' do
    it 'has right fullname' do
      user = FactoryGirl.create(:user, firstname: 'Phuong', lastname: 'Tran')
      user.fullname.should == 'Phuong Tran'
    end
  end

  context 'mailboxer setting' do
    let(:user) { FactoryGirl.create(:user) }
    subject { user }

    it 'choose email method when receive notification' do
      subject.mailboxer_email(Mailboxer::Notification.new).should be_nil 
    end

    it 'does nothing when receive message' do
      subject.mailboxer_email(Mailboxer::Message.new).should be_nil 
    end
  end

end
