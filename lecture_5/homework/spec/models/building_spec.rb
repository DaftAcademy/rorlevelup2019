# frozen_string_literal: true

#
# this tests was created due to TDD
#
#
require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.describe Building, type: :model do
  describe 'creating new buildings' do
    before(:each) do
      @clan = create(:clan, id: 1, name: 'Klana')
      @building = create(:building, granary: 100)
      @warrior1 = create(:warrior, building_id: @building.id, name: 'Zed Dead', death_date: (Date.today - 4), clan_id: @clan.id)
      @warrior2 = create(:warrior, building_id: @building.id, name: 'Rob Zombie', death_date: (Date.today - 9), clan_id: @clan.id)
      @warrior3 = create(:warrior, building_id: @building.id, name: 'Leif Hynnekleiv', clan_id: @clan.id, horse: true)
      @warrior4 = create(:warrior, name: 'Some New Guy', clan_id: @clan.id, horse: true)
    end

    it 'is building object' do
      expect(@building).to be_an(Building)
    end

    it 'works with with_horse scope' do
      expect(@building.warriors.with_horse.count).to eq(1)
    end

    it 'works with with scope' do
      expect(@building.warriors.without_horse.count).to eq(2)
    end

    it 'is not valid without granary' do
      @building.granary = nil
      expect(@building).not_to be_valid
    end

    it 'is not valid without siege_ability' do
      @building.siege_ability = nil
      expect(@building).not_to be_valid
    end

    it 'building is valid in default curcumstances' do
      expect(@building).to be_valid
    end

    it 'updates when anoter living  warrior joins' do
      horsey_sum = @building.warriors.with_horse.count
      @warrior4.building_id = @building.id
      @warrior4.save
      expect(@building.warriors.with_horse.count).to eq(horsey_sum + 1)
    end

    it 'is working ok when siege ability works' do
      expect(Reports::SiegeReport.new(building: @building).call).to eq(8)
    end
  end
end
