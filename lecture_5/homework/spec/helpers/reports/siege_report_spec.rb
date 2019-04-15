# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :helper do
  subject(:clan) { create(:clan) }
  subject(:building) { create(:building) }
  context(' valid data ') do
    it 'set building siege_value to be 250' do
      create(:warrior,:samurai, clan: clan, building: building)
      create(:warrior,:samurai, clan: clan, building: building)
      Reports::SiegeReport.check_siege_ability(building: building)
      expect(building.siege_ability).to eq(250)
    end
  end

  context(' invalid data ') do
    it 'should return nothing' do
      expect(Reports::SiegeReport.check_siege_ability(building: nil)).to be_nil
    end

    it 'should set building to 0 siege_ability' do
      Reports::SiegeReport.check_siege_ability(building: building)
      expect(building.siege_ability).to eq(0)
    end
  end
end
