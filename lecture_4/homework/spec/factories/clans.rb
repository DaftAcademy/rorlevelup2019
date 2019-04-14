# frozen_string_literal: true

FactoryBot.define do
  factory :clan do
    name { Faker::Name.last_name }
  end
end
