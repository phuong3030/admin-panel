FactoryGirl.define do
  sequence(:url) { |n| "http://url#{n}.com" }
  sequence(:name) { |n| "name#{n}" }
  sequence(:icon) { |n| "icon#{n}" }

  factory :function, class: Admin::Function do
    name
    url
    icon
  end

  factory :sidebar, class: Admin::Sidebar do
    name
    url
    icon
    type 'Admin::Sidebar'
  end

  factory :menu, class: Admin::Menu do
    name
    url
    icon
    type 'Admin::Menu'
  end

end
