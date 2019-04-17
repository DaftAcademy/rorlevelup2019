# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildingsController, type: :request do
  describe 'GET /buildings' do
    it 'responds with 200' do
      get '/buildings'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['data']).to be_empty
    end
  end

  describe 'GET /buildings/:id' do
    it 'response with 404' do
      get '/buildings/999'
      expect(response).to have_http_status(404)
    end
  end

  describe 'GET /buildings/:id' do
    let(:building) { create(:building) }

    it 'response with 200' do
      get "/buildings/#{building.id}"
      expect(response).to have_http_status(200)
    end
  end
end
