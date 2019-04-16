# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { 'Black Gate' }
    type { 'Buildings::Walls' }
    granary { 0 }
  end
end
