FactoryBot.define do
  factory :user do
     #email { Faker::Internet.email }
     name {Faker::Name.name}
     phone_no { Faker::PhoneNumber.phone_number }
  end
end
