# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :building do
    name { 'Test building' }
    type { 'Buildings::Stronghold' }
    granary { 0 }
  end

  factory :clan do
    name { 'Test Clan' }
  end

  factory :samurai, class: 'Warriors::Samurai' do
    association(:clan)
    name { 'Test Samurai' }
  end

  factory :hussar, class: 'Warriors::Hussar' do
    association(:clan)
    name { 'Test Hussar' }
  end
end
