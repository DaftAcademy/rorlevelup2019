# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :building do
    name { 'Western Walls' }
    type { 'Buildings::Walls' }
    granary { 200 }
  end

  factory :clan do
    name { 'Froggy' }
  end

  factory :warrior do
    association(:clan)
    name { 'Frog Samurai' }
  end
end
