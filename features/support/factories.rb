require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :username do |n|
    "name#{n}"
  end

  factory :role, :class => Core::Role do
    name 'admin'
  end

  factory :user, :class => Core::User do
    email
    username
    password 'password'
    password_confirmation 'password'

    factory :user_admin_role do
      after(:create) do |user|
        user.roles << FactoryGirl.create(:role)
      end
    end
  end
end
