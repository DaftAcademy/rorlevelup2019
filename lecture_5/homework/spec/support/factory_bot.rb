RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :building do
    name { 'Main stronghold' }
    type { 'Buildings::Stronghold' }
    granary { 500 }
  end

  factory :clan do
    name { 'Secret clan' }
  end

  factory :samurai, class: 'Warrior' do
    association(:clan)
    name { 'Teddy the Warrior' }
    type { 'Warriors::Samurai' }
  end

  factory :hussar, class: 'Warrior' do
    association(:clan)
    name { 'Zawisza Czarny' }
    type { 'Warriors::Hussar' }
  end
end