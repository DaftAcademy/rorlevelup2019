FactoryBot.define do

  factory :stronghold, class: Buildings::Stronghold do
    name { Faker::Lorem.word }
    granary { Faker::Number.between(1, 50) }
  end

end
