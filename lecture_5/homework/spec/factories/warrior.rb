FactoryBot.define do
  factory :warrior do
    clan_id { 1 }
    preferred_weapon_kind { 'melee' }
    horse { true }
    join_date{ Date.today - rand(1000) }
  end
end
