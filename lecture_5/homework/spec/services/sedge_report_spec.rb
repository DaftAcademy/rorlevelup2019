# frozen_string_literal: true

require 'rails_helper'

describe Reports::SiegeReport do
  subject(:siege_report) { Reports::SiegeReport.new(building: building) }

  let(:building) { create(:building, name: building_name, granary: building_granary) }
  let(:building_name) { 'default' }

  describe 'no warriors and granary' do
    let(:building_granary) { 0 }

    it 'without granary and warriors returns 0' do
      expect(siege_report.call).to eq(0)
    end
  end

  describe 'no warriors' do
    let(:building_granary) { 11 }

    it 'without warriors returns 0' do
      expect(siege_report.call).to eq(0)
    end
  end

  describe 'warriors and granary' do

    context 'one inflantry' do
      let(:warrior1) { build(:samurai) }
      let(:building_granary) { 11 }

      it 'should return 1' do
        warrior1.building = building
        warrior1.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'one cavalery' do
      let(:warrior1) { build(:hussar) }
      let(:building_granary) { 12 }

      it 'should return 1' do
        warrior1.building = building
        warrior1.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'both' do
      let(:warrior1) { build(:hussar, name: 'default2') }
      let(:warrior2) { build(:samurai) }
      let(:building_granary) { 12 }

      it 'should return 1' do
        warrior1.building = building
        warrior1.save
        warrior2.building = building
        warrior2.save
        expect(siege_report.call).to eq(0)
      end
    end
  end
end
