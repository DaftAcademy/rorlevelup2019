# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { 'our building' }
    type { 'Buildings::Stronghold' }
  end
end
