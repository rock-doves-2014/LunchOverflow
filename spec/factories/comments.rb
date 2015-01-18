FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
  end

  factory :invalid_comment do
    content nil
  end
end