FactoryBot.define do
  factory :mercenary do
    name { "Alfred"}
    experience { 50 }
    preferred_weapon_kind { "ranged" }
    available_from { Date.today - 1 }
    price { 100 }
    warrior_id { 1 }
  end
end
