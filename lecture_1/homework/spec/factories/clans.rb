FactoryBot.define do
  factory :clan do
    name { Faker::Football.team }
  end
end