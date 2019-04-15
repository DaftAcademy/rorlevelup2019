# frozen_string_literal: true

FactoryBot.define do
  factory :warrior do
    name { Faker::Name.last_name }
    type { 'Warriors::Samurai' }
  end
end
