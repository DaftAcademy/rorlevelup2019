FactoryBot.define do
  factory :clan do
    name { Faker::Name.unique.name }
  end
end