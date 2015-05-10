require 'rails_helper'

RSpec.describe Admin::FunctionsRoles, type: :model do

  context 'associations and index' do
    it { should belong_to(:function) }
    it { should belong_to(:role) }
  end
  
end
