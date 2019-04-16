# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :helper do
  subject(:clan) { create(:clan) }
  subject(:building) { create(:building) }
  subject(:building2) { create(:building) }
  context(' valid data ') do
    it 'set building siege_value to be 250' do
      w1 = create(:warrior, :samurai, clan: clan, building: building)
      w2 = create(:warrior, :samurai, clan: clan, building: building)
      #Reports::SiegeReport.call(building: building)
      expect(building.siege_ability).to eq(250)
    end

    it 'set building siege_value to be 500 after one warrior was destroyed' do
      w1 = create(:warrior, :samurai, clan: clan, building: building)
      w2 = create(:warrior, :samurai, clan: clan, building: building)
      #Reports::SiegeReport.call(building: building)
      w2.destroy!
      expect(building.siege_ability).to eq(500)
    end

    it 'set building siege_value to be 0 after both warriors was destroyed' do
      w1 = create(:warrior, :samurai, clan: clan, building: building)
      w2 = create(:warrior, :samurai, clan: clan, building: building)
      #Reports::SiegeReport.call(building: building)
      w1.destroy!
      w2.destroy!
      expect(building.siege_ability).to eq(0)
    end

    it 'set building siege_value to be 250 after building change' do
      w1 = create(:warrior, :samurai, clan: clan, building: building)
      w2 = create(:warrior, :samurai, clan: clan, building: building2)
      #Reports::SiegeReport.call(building: building)
      w2.update!(building: building)
      w2.save!
      expect(building.siege_ability).to eq(250)
    end

    it 'set building siege_value to be 250 after building change' do
      w1 = create(:warrior, :samurai, clan: clan, building: building)
      w2 = create(:warrior, :samurai, clan: clan, building: building)
      #Reports::SiegeReport.call(building: building)
      w2.update!(building: building2)
      w2.save!
      expect(building.siege_ability).to eq(250)
    end
  end

  context(' invalid data ') do
    it 'should return nothing' do
      expect(Reports::SiegeReport.call(building: nil)).to be_nil
    end

    it 'should set building to 0 siege_ability' do
      Reports::SiegeReport.call(building: building)
      expect(building.siege_ability).to eq(0)
    end
  end
end
