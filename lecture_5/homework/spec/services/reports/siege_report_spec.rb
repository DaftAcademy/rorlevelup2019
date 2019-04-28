# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) { described_class.new(params).call }

  let(:params)   { { building: building } }
  let(:building) { create(:building, warriors: army) }
  let(:army)     { [] }

  describe '#call' do
    context 'with building without army' do
      it 'returns report with siege ability equals to 0' do
        expect(siege_report).to eq(0)
      end
    end

    context 'with building which has an army' do
      context 'when 10 samurais' do
        let(:army) { create_list(:warrior, 10, :samurai) }

        it 'returns report with siege ability equals to 5' do
          expect(siege_report).to eq(5)
        end
      end

      context 'when 10 hussars' do
        let(:army) { create_list(:warrior, 10, :hussar) }

        it 'returns report with siege ability equals to 3' do
          expect(siege_report).to eq(3)
        end
      end

      context 'when 5 hussars and 5 samurais' do
        let(:army) { create_list(:warrior, 10) }

        it 'returns report with siege ability equals to 4' do
          expect(siege_report).to eq(4)
        end
      end

      context 'when the number of warriors exceeds daily granary abilities' do
        let(:army) { create_list(:warrior, 100) }

        it 'returns report with siege ability equals to 0' do
          expect(siege_report).to eq(0)
        end
      end
    end

    context 'with building which has an army but the granary is empty' do
      let(:building) { create(:building, warriors: army, granary: 0) }
      let(:army) { create_list(:warrior, 10) }

      it 'returns report with siege ability equals to 0' do
        expect(siege_report).to eq(0)
      end
    end
  end
end
