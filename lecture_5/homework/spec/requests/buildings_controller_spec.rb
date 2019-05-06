# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.describe 'BuildingController', type: :request do
  subject(:building) { create(:building) }

  describe 'index action' do
    it 'response with status OK' do
      get('/buildings')
      expect(response).to have_http_status(200)
    end
  end

  describe 'show action' do
    it 'has status 200 and proper attributes' do
      get "/buildings/#{building.id}"
      expect(response.status).to eq(200)
      expect(response).to be_success # accualy it is the same as above
      expect(response.body).to include(building.name.to_s)
    end

    it 'responds with 404 when invalid id' do
      get '/buildings/2019'
      expect(response).to have_http_status(404)
    end
  end
end
