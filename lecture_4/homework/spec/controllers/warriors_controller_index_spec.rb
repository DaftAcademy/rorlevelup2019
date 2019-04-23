# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.clean_with :transaction

RSpec.describe Clans::WarriorsController, type: :controller do
  describe 'with Alive parameter'
  before(:all) do
    @clan = create(:clan, id: 1, name: 'Klan')
    @warrior1 = create(:warrior, name: 'Zed Dead', death_date: (Date.today - 4), clan_id: @clan.id)
    @warrior2 = create(:warrior, name: 'Rob Zombie', death_date: (Date.today - 9), clan_id: @clan.id)
    @warrior3 = create(:warrior, name: 'Leif Hynnekleiv', clan_id: @clan.id)
  end

  it 'respond with only living when key: :alive' do
    get :index, params: { clan_id: @clan.id, alive: true }
    expect(response.body).to include('Zombie')
    expect(response.body).not_to include('Leif')
  end

  it 'respond with dead wariors if everybody died' do
    @warrior3.death_date = (Date.today - 1)
    get :index, params: { clan_id: @clan.id, alive: true }
    expect(response.body).to include('Zombie')
  end

  it 'has death warriors and living warriors when no key' do
    get :index, params: { clan_id: @clan.id }

    expect(response.body).to include('Zombie')
    expect(response.body).to include('Leif')
  end
end
