# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { Faker::Games::Witcher.location }
    type { 'Buildings::Walls' }
    granary { 500 }
  end
end
