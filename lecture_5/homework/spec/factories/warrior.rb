# frozen_string_literal: true

FactoryBot.define do
  factory :warrior do
    name { 'Gienio' }
    clan_id { 1 }
    type { 'Warriors::Samurai' }
    preferred_weapon_kind { 'melee' }
    join_date { Date.today - rand(1000) }
  end
end
