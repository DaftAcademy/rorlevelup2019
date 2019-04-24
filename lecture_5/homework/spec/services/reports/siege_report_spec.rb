# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.describe Reports::SiegeReport do
  subject(:siege_report) { Reports::SiegeReport.new(building: building).call }

  let(:building) { create(:building, granary: 100) }
  let(:clan) { create(:clan) }

  describe 'siege ability' do
    context 'with no warriors' do
      it 'has 0' do
        expect(siege_report).to eq(0)
      end
    end

    context 'with 1 infantry' do
      let(:warrior) { create(:warrior, clan_id: clan.id, building_id: building.id) }

      it 'returns 9' do
        warrior.save
        expect(siege_report).to eq(9)
      end
    end

    context 'with 1 horsey' do
      let(:rysiu) { create(:hussar, clan_id: clan.id, building_id: building.id) }

      it 'returns 8' do
        rysiu.save
        expect(siege_report).to eq(8)
      end
    end

    context 'with 1 horsey and 1 infantry ' do
      let(:gienio) { create(:warrior, clan_id: clan.id, building_id: building.id) }
      let(:rysiu) { create(:hussar, clan_id: clan.id, building_id: building.id) }

      it 'returns 7' do
        gienio.save
        rysiu.save
        expect(siege_report).to eq(7)
      end
    end

    context 'when rysiu and his horse dies' do
      let(:gienio) { create(:warrior, clan_id: clan.id, building_id: building.id) }
      let(:rysiu) { create(:hussar, clan_id: clan.id, building_id: building.id, death_date: Date.yesterday) }

      it 'returns 9' do
        gienio.save
        rysiu.save
        expect(siege_report).to eq(9)
      end

      it 'will not returns 7' do
        gienio.save
        rysiu.save
        expect(siege_report).not_to eq(7)
      end
    end
  end
end
