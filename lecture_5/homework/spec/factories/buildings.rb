# frozen_string_literal: true

FactoryBot.define do
  factory :building, class: Building do
    sequence(:name) { |i| "Building_#{i}" }
    sequence(:siege_ability) { 0.0 }
    sequence(:type) { |i| "Buildings::#{i.even? ? 'Walls' : 'Stronghold'}" }
    sequence(:granary) { |i| i * 100 }
  end
end
