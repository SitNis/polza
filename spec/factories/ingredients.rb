FactoryBot.define do
  sequence :name do |n|
    "ingredient#{n}"
  end

  factory :ingredient do
    name
  end
end
