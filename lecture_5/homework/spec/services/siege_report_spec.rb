# frozen_string_literal: true

require 'rails_helper'

describe Reports::SiegeReport do
  subject(:siege_report) { described_class.new(building: building) }

  let(:building) do
    create(:building,
           name: building_name,
           granary: building_granary)
  end
  let(:building_name) { 'Black Gate' }

  describe '#call' do
    context 'without granary' do
      let(:building_granary) { 0 }

      it 'returns 0' do
        expect(siege_report.call).to eq(0)
      end
    end

    context 'without warriors' do
      let(:building_granary) { 11 }

      it 'returns 0' do
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with one infantry' do
      let(:warrior) { build(:samurai) }
      let(:building_granary) { 11 }

      it 'returns 1' do
        warrior.building = building
        warrior.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'with one cavalry' do
      let(:warrior) { build(:hussar) }
      let(:building_granary) { 12 }

      it 'returns 1' do
        warrior.building = building
        warrior.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'with one infantry and one cavalry' do
      let(:warrior1) { build(:samurai, name: 'Lee') }
      let(:warrior2) { build(:hussar) }
      let(:building_granary) { 12 }

      it 'returns 1' do
        warrior1.building = building
        warrior1.save
        warrior2.building = building
        warrior2.save
        expect(siege_report.call).to eq(1)
      end
    end
  end
end
