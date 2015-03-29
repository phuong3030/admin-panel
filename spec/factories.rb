FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@example.com" }
  sequence(:username) { |n| "name#{n}" }
  sequence(:firstname) { |n| "firstname#{n}" }
  sequence(:lastname) { |n| "lastname#{n}" }

  factory :role, :class => Admin::Role do
    name 'admin'
  end

  factory :group, :class => Admin::Group do
    name 'admin'

    factory :group_admin do
      after(:create) do |group|
        group.roles << FactoryGirl.create(:role)
      end
    end
  end

  factory :user, :class => Admin::User do
    email
    username
    firstname
    lastname
    password 'password'
    password_confirmation 'password'
  end
end
