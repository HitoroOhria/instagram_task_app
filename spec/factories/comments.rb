FactoryBot.define do
  factory :comment do
    message "Test Comment"
    association :micropost
    user { micropost.user }
  end
end
