# frozen_string_literal: true

FactoryBot.define do
  factory :hussar, class: 'Warriors::Hussar' do
    name { 'Rysiu' }
    clan_id { 1 }
    type { 'Warriors::Hussar' }
    preferred_weapon_kind { 'melee' }
    join_date { Date.today - rand(1000) }
  end
end
