# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  describe 'GET /buildings' do
    it 'responds with 200' do
      get '/buildings'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /buildings/:id' do
    let(:building) { create(:building, name: building_name, granary: building_granary) }
    let(:building_name) { 'default' }
    let(:building_granary) { 100 }

    it 'responds with 200' do
      get "/buildings/#{building.id}"
      expect(response).to have_http_status(200)
    end

    context 'destroy' do
      before { building.destroy }

      it 'responds with 404' do
        get "/buildings/#{building.id}"
        expect(response).to have_http_status(404)
      end
    end
  end
end
