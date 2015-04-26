FactoryGirl.define do
  factory :group, class: Admin::Group do
    name 

    factory :group_admin, class: Admin::Group do
      after(:create) do |group|
        group.roles << FactoryGirl.create(:role)
      end
    end
  end

end
