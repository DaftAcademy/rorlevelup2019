# frozen_string_literal: true

FactoryBot.define do
  factory :warrior, class: 'Warrior' do
    association(:building)
    association(:clan)
    name { 'Lee' }

    factory :hussar, parent: :warrior, class: 'Warriors::Hussar' do
    end

    factory :samurai, parent: :warrior, class: 'Warriors::Samurai' do
    end
  end
end
