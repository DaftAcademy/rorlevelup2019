# frozen_string_literal: true

FactoryBot.define do
  factory :building do
    name { 'default' }
    type { 'Buildings::Walls' }
    granary { 0 }
  end
end

FactoryBot.define do
  factory :warrior, class: 'Warrior' do
    association(:building)
    association(:clan)
    name { 'default' }
  end

  factory :samurai, parent: :warrior, class: 'Warriors::Samurai' do
  end

  factory :hussar, parent: :warrior, class: 'Warriors::Hussar' do
  end
end

FactoryBot.define do
  factory :clan do
    name { 'default' }
  end
end
