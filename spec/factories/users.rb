FactoryBot.define do
  factory :user do
    name  "Tester"
    sequence(:email)  { |n| "tester#{n}@exapmple.com" }
    password  "foobar"
    password_confirmation "foobar"
    admin  false
    activated  true
    activated_at  Time.zone.now
    
    trait :admin do
      admin true
    end
    
    trait :not_activation do
      activated false
    end
    
    trait :faker_email do
      email Faker::Internet.email
    end
    
  end
end
