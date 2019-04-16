require 'rails_helper'
require 'pry'

RSpec.describe 'Buildings API', type: :request do

  let!(:strongholds) { create_list(:stronghold, 5) }
  let(:stronghold_long_survive) { create(:stronghold, granary: 100) }

  describe 'GET /builidings' do

    before { get '/buildings' }

    it 'returns all buidlings' do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(5)
    end

    it 'returnes a status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'GET /buildings/:id' do

    context 'building with 100 food units' do

      before { get "/buildings/#{stronghold_long_survive.id}" }

      it 'calculates the siege-ability properly' do
        expect(json["data"]["attributes"]["granary"]).to eq(100)
      end

    end

    context 'non existing building (id => 1000)' do

      before { get "/buildings/1000" }

      it 'returns a status code 404' do
        expect(response).to have_http_status(404)
      end

    end

  end

end
