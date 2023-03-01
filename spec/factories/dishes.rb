FactoryBot.define do
  factory :dish do
    name
    association :ingredients
  end
end
