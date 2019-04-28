# frozen_string_literal: true

FactoryBot.define do
  factory :clan, class: Clan do
    sequence(:name) { |i| "Clan number #{i}" }
  end
end
