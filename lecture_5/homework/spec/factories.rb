# frozen_string_literal: true

FactoryBot.define do
  factory :clan do
    name { 'ClanName' }
  end

  factory :building do
    name { 'BuildingName' }
    type { 'Buildings::Stronghold' }
    granary { 0 }
  end

  factory :warrior, class: 'Warrior' do
    association(:building)
    association(:clan)
    name { 'WarriorName' }
  end

  factory :samurai, parent: :warrior, class: 'Warriors::Samurai' do
    name { 'SamuraiName' }
  end

  factory :hussar, parent: :warrior, class: 'Warriors::Hussar' do
    name { 'HussarName' }
  end
end
