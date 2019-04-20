# frozen_string_literal: true

FactoryBot.define do
  factory :warrior do
    clan_id { 1 }
    preferred_weapon_kind { 'melee' }
  end
end
