# frozen_string_literal: true

FactoryBot.define do
  factory :building, class: Building do
    sequence(:name) { |i| "Building_#{i}" }
    type { 'Buildings::Walls' }
    sequence(:granary) { |i| i * 100 }
  end
end
