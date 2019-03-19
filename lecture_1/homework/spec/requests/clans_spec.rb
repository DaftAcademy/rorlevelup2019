require 'rails_helper'

RSpec.describe 'Clans API', type: :request do

  let!(:clans) { create_list(:clans, 10) }
  let(:clan_id) { clans.first.id }

  describe 'GET /clans' do
    before { get '/clans' }

    it 'should return clans' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /clans/:id' do
    before { get "/clans/#{clan_id}" }

    context 'when the record exists' do
      it 'should return the clan' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(clan_id)
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:clan_id) { 100 }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match(/Couldn't find Clan/)
      end
    end
  end

  describe 'POST /clans' do
    let(:valid_attributes) { { name: 'Clan Example' } }

    context 'when the request is valid' do
      before { post '/clans', params: valid_attributes }

      it 'should create a clan' do
        expect(json['name']).to eq('Clan Example')
      end

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/clans', params: { name: nil } }

      it 'should return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'should return a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Name can't be blank/)
      end
    end
  end
end