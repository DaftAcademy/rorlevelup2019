# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  describe 'GET /buildings' do
    before { create_list(:building, 2) }

    it 'responds with 200' do
      get '/buildings'
      expect(response).to have_http_status(200)
    end

    it 'includes correct number of records' do
      get '/buildings'
      response_json = JSON.parse(response.body)
      expect(response_json['data'].size).to eq(2)
    end
  end

  describe 'GET /buildings/:id' do
    let(:building) do
      create(:building,
             name: building_name,
             granary: building_granary)
    end
    let(:building_name) { 'Black Gate' }
    let(:building_granary) { 100 }

    it 'includes correct name' do
      get "/buildings/#{building.id}"
      response_json = JSON.parse(response.body)
      expect(response_json.dig('data', 'attributes', 'name')).to eq(building_name)
    end

    it 'includes correct granary amount' do
      get "/buildings/#{building.id}"
      response_json = JSON.parse(response.body)
      expect(response_json.dig('data', 'attributes', 'granary')).to eq(building_granary)
    end

    it 'responds with 200' do
      get "/buildings/#{building.id}"
      expect(response).to have_http_status(200)
    end

    context 'when destroy building' do
      before { building.destroy }

      it 'responds with 404' do
        get "/buildings/#{building.id}"
        expect(response).to have_http_status(404)
      end
    end
  end
end
