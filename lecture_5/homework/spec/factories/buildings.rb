# frozen_string_literal: true

FactoryBot.define do
  factory :building, class: Building do
    sequence(:name) { |i| "Building_#{i}" }
    sequence(:type) { |i| "Buildings::#{i.even? ? 'Walls' : 'Stronghold'}" }
    granary { 100 }
  end
end
