# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { Faker::Name.last_name }
    type { 'Buildings::Walls' }
    granary { 500 }
  end
end