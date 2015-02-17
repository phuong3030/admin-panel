FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@example.com" }
  sequence(:username) { |n| "name#{n}" }

  factory :role, :class => Admin::Role do
    name 'admin'
  end

  factory :user, :class => Admin::User do
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
