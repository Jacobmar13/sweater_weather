FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: 'gmail') }
    password_digest { Faker::Number.unique.number(digits: 5) }
  end
end
