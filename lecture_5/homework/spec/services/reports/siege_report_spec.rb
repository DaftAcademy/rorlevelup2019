require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.describe Reports::SiegeReport do
  subject(:siege_report) { Reports::SiegeReport.new(building: building).call}

  let(:building) { create(:building, granary: 100) }

  describe "siege report" do
    context "with 0 warriors" do

      it 'returns siege_ability = 0' do
        byebug
        expect(siege_ability.call).to eq(0)
      end
    end

    context 'with 1 warrior' do
      let(:clan) { create(:clan) }
      let(:warrior) { create(:warrior, name: 'Piotr', clan_id: clan.id, death_date: nil,
                             building_id: building.id, type: 'Warriors::Samurai', horse: false) }

      it 'returns 9' do
        expect(siege_report.call).to eq(9)
      end
    end
  end
end
