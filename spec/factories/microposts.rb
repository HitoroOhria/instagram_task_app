FactoryBot.define do
  factory :micropost do
    content "Tset Content"
    association :user
    
    trait :most_recent do
      created_at 10.minute.from_now
    end
    
  end
end
