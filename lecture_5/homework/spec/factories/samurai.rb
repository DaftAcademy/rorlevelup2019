FactoryBot.define do

  factory :samurai, class: Warriors::Samurai do
    name { Faker::Artist.name }
    building { Building.first }
  end

end
