# frozen_string_literal: true

FactoryBot.define do
  factory :clan do
    name { Faker::Games::Witcher.school }
  end
end
