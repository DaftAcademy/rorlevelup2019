# frozen_string_literal: true

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
  end

  describe '#call' do
    context 'when building with one samurai' do
      let(:warrior) { build(:warrior, building: building) }

      it 'returns 18' do
        warrior.save
        expect(siege_report).to eq(18)
      end
    end
  end

  describe '#call' do
    context 'when building with one hussar' do
      let(:warrior) { build(:warrior, type: warrior_type, building: building) }
      let(:warrior_type) { 'Warriors::Hussar' }

      it 'returns 16' do
        warrior.save
        expect(siege_report).to eq(16)
      end
    end
  end

  describe '#call' do
    context 'when building with two types of warriors' do
      let(:warrior1) { build(:warrior, building: building) }
      let(:warrior2) { build(:warrior, name: hussar_name, type: warrior_type, building: building) }
      let(:hussar_name) { 'Frog Hussar' }
      let(:warrior_type) { 'Warriors::Hussar' }

      it 'returns 15' do
        warrior1.save
        warrior2.save
        expect(siege_report).to eq(15)
      end
    end
  end
end
