# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Warrior, type: :model do
  subject(:warrior) { Warrior.new(params) }
  subject(:clan) { Clan.create!(name: 'example clan') }
  subject(:building) { Buildings::Walls.create!(name: 'example wall') }

  describe '#validation' do
    context 'valid params' do
      fname = Faker::Name.name
      faq = Faker::Number.between(1, 99)
      let(:params) { { name: fname, clan_id: clan.id, building_id: building.id, armor_quality: faq } }

      it 'warrior should be valid' do
        expect(warrior).to be_valid
      end

      it 'should have name' do
        expect(warrior.name).to eq(fname)
      end
      it 'should have armor' do
        expect(warrior.armor_quality).to eq(faq)
      end
    end

    context 'invalid clan' do
      let(:params) { { name: 'testw', building_id: building.id } }

      it 'should not be valid' do
        expect(warrior).not_to be_valid
      end
    end

    context 'invalid building' do
      let(:params) { { name: 'testw', building_id: building.id } }

      it 'should not be valid' do
        expect(warrior).not_to be_valid
      end
    end

    context 'invalid armor_quality' do
      let(:params) { { name: 'testw', clan_id: clan.id, building_id: building.id, armor_quality: 999 } }

      it 'should not be valid' do
        expect(warrior).not_to be_valid
      end
    end

    context ''
  end
end