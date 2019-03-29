FactoryBot.define do
  factory :clan do
    name { Faker::Team.creature.capitalize }
  end
end
