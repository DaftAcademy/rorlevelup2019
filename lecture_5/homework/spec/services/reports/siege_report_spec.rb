require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) { Reports::SiegeReport.new(building: building).call }

  let(:building) { create(:building) }

  describe '#call' do
    context 'when building without warriors' do
      it 'returns 0' do
        expect(siege_report).to eq(0)
      end
    end

    context 'when building has 1 samurai' do
      let(:samurai) { build(:samurai, building: building) }
      it 'should return 45' do
        samurai.save
        expect(siege_report).to eq(45)
      end
    end

    context 'when building has 1 hussar' do
      let(:hussar) { build(:hussar, building: building) }
      it 'should return 4q' do
        hussar.save
        expect(siege_report).to eq(41)
      end
    end

    context 'when building has 1 hussar and 1 samurai' do
      let(:hussar) { build(:hussar, building: building) }
      let(:samurai) { build(:samurai, building: building) }

      it 'should return 38' do
        hussar.save
        samurai.save
        expect(siege_report).to eq(38)
      end
    end
  end
end