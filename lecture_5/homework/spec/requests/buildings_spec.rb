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
    it 'response with 404' do
      get '/buildings/1'
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
