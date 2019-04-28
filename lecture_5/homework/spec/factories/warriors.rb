# frozen_string_literal: true

FactoryBot.define do
  factory :warrior, class: Warrior do
    association(:clan)
    association(:building)
    sequence(:type) { |i| i.even? ? 'Warriors::Hussar' : 'Warriors::Samurai' }
    sequence(:name) { |i| "Warrior #{i}" }
    preferred_weapon_kind { 'melee' }
    armor_quality { 0 }
    number_of_battles { 0 }
    join_date { Time.now }
    death_date { nil }

    trait :hussar do
      type { 'Warriors::Hussar' }
    end

    trait :samurai do
      type { 'Warriors::Samurai' }
    end
  end
end
