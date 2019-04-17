# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) { Reports::SiegeReport.new(building: building) }
  let(:building) { FactoryBot.create(:building, granary: building_granary) }
  let(:clan) { create(:clan) }

  describe '#call' do
    context 'without warriors' do
      let(:building_granary) { 1000 }
      it 'returns 0' do
        expect(siege_report.call).to eq(0)
      end
    end

    context 'without supplies' do
      let(:building_granary) { 0 }
      let(:samurai) { FactoryBot.create(:samurai, building: building) }
      it 'returns 0' do
        samurai.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 samurai and 10 supplies' do
      let(:building_granary) { 10 }
      let(:samurai) { FactoryBot.create(:samurai, building: building) }

      it 'returns 1' do
        samurai.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 samurai and 11 supplies' do
      let(:building_granary) { 11 }
      let(:samurai) { FactoryBot.create(:samurai, building: building) }

      it 'returns 1' do
        samurai.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'with 1 samurai and 25 supplies' do
      let(:building_granary) { 25 }
      let(:samurai) { FactoryBot.create(:samurai, building: building) }

      it 'returns 2' do
        samurai.save
        expect(siege_report.call).to eq(2)
      end
    end

    context 'with 1 hussar and 10 supplies' do
      let(:building_granary) { 10 }
      let(:hussar) { FactoryBot.create(:hussar, building: building) }

      it 'returns 0' do
        hussar.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 hussar and 11 supplies' do
      let(:building_granary) { 11 }
      let(:hussar) { FactoryBot.create(:hussar, building: building) }

      it 'returns 0' do
        hussar.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 hussar and 12 supplies' do
      let(:building_granary) { 12 }
      let(:hussar) { FactoryBot.create(:hussar, building: building) }

      it 'returns 1' do
        hussar.save
        expect(siege_report.call).to eq(1)
      end
    end

    context 'with 1 hussar, 1 samurai and 11 supplies' do
      let(:building_granary) { 11 }
      let(:hussar) { FactoryBot.create(:hussar, name: 'HussarName') }
      let(:hussar2) { FactoryBot.create(:hussar, name: 'HussarName2') }
      let(:samurai) { FactoryBot.create(:samurai, name: 'SamuraiName') }

      it 'returns 0' do
        hussar.save
        hussar2.save
        samurai.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 hussar, 1 samurai and 12 supplies' do
      let(:building_granary) { 12 }
      let(:hussar) { FactoryBot.create(:hussar, name: 'HussarName') }
      let(:samurai) { FactoryBot.create(:samurai, name: 'SamuraiName') }

      it 'returns 0' do
        hussar.save
        samurai.save
        expect(siege_report.call).to eq(0)
      end
    end

    context 'with 1 hussar, 1 samurai and 13 supplies' do
      let(:building_granary) { 13 }
      let(:hussar) { FactoryBot.create(:hussar, name: 'HussarName') }
      let(:samurai) { FactoryBot.create(:samurai, name: 'SamuraiName') }

      it 'returns 1' do
        hussar.save
        samurai.save
        expect(siege_report.call).to eq(1)
      end
    end
  end
end

# Reports::SiegeReport#call with 1 hussar, 1 samurai and 11 supplies returns 0
# Failure/Error: let(:hussar2) { FactoryBot.create(:hussar, name: 'HussarName2') }

# ActiveRecord::RecordInvalid:
# Validation failed: Name has already been taken
