FactoryBot.define do 
  factory :samurai do
    association :clan, factory: :clan, strategy: :build
    name { "Jack" }
    armor { 111 }
    fought_battles { 4 }
    clan_id { 1 }
  end 
end 
