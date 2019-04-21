# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :report do
  subject(:siege_ability) { Reports::SiegeReport.new(building: building) }

  let(:building) { create(:building, granary: building_granary) }
  let(:building_granary) { 0 }

  describe '#call' do
    context 'with no warriors and empty granary' do
      it 'returns 0' do
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with no warriors and insufficient granary' do
      let(:building_granary) { 8 }

      it 'returns 0' do
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with no warriors and sufficient granary' do
      let(:building_granary) { 12 }

      it 'returns 0' do
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with samurai and empty granary' do
      let(:building_granary) { 0 }
      let(:samurai_warrior) { build(:samurai, building: building) }

      it 'returns 0' do
        samurai_warrior.save
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with samurai and sufficient granary' do
      let(:building_granary) { 11 }
      let(:samurai_warrior) { build(:samurai, building: building) }

      it 'returns 1' do
        samurai_warrior.save
        expect(siege_ability.call).to eq(1)
      end
    end

    context 'with samurai and insufficient granary' do
      let(:building_granary) { 10 }
      let(:samurai_warrior) { build(:samurai, building: building) }

      it 'returns 0' do
        samurai_warrior.save
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with hussar and sufficient granary' do
      let(:building_granary) { 12 }
      let(:hussar_warrior) { build(:hussar, building: building) }

      it 'returns 1' do
        hussar_warrior.save
        expect(siege_ability.call).to eq(1)
      end
    end

    context 'with hussar and insufficient granary' do
      let(:building_granary) { 11 }
      let(:hussar_warrior) { build(:hussar, building: building) }

      it 'returns 0' do
        hussar_warrior.save
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with warriors and sufficient granary' do
      let(:building_granary) { 13 }
      let(:hussar_warrior) { build(:hussar, building: building) }
      let(:samurai_warrior) { build(:samurai, building: building) }

      it 'returns 1' do
        hussar_warrior.save
        samurai_warrior.save
        expect(siege_ability.call).to eq(1)
      end
    end

    context 'with warriors and insufficient granary' do
      let(:building_granary) { 12 }
      let(:hussar_warrior) { build(:hussar, building: building, name: 'Hussar test') }
      let(:samurai_warrior) { build(:samurai, building: building, name: 'Samurai test') }

      it 'returns 0' do
        hussar_warrior.save
        samurai_warrior.save
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with samurai delete and sufficient granary' do
      let(:building_granary) { 100 }
      let(:samurai_warrior) { build(:samurai, building: building) }

      it 'returns 0' do
        samurai_warrior.save
        samurai_warrior.delete
        expect(siege_ability.call).to eq(0)
      end
    end
  end
end
