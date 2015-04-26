FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@example.com" }
  sequence(:username) { |n| "name#{n}" }
  sequence(:firstname) { |n| "firstname#{n}" }
  sequence(:lastname) { |n| "lastname#{n}" }

  factory :user, :class => Admin::User do
    email
    username
    firstname
    lastname
    password 'password'
    password_confirmation 'password'
  end
  
 end
