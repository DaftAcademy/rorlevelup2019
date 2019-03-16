FactoryBot.define do
  factory :samurai do
    name { Faker::Movies::StarWars.character }
  end
end