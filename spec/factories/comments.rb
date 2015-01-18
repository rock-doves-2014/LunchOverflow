FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
  end

  factory :invalid_contact do
    firstname nil
  end
end