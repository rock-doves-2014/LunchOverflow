FactoryGirl.define do

  factory :user, class:Hash do
    user_name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :invalid_user, class:Hash do
    user_name nil
    email nil
    password nil
  end
end
