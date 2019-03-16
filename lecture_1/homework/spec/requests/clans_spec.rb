require 'rails_helper'

RSpec.describe 'Clan API', type: :request do
  let!(:clans) { create_list(:clan, 10) }
  let(:clan_id) { clans.first.id }

  describe 'GET /api/clans' do
    before { get '/api/clans' }

    it 'returns clans' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/clans/:id' do
    before { get "/api/clans/#{clan_id}" }

    context 'when the record exists' do
      it 'returns the clan' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(clan_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:clan_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Clan/)
      end
    end
  end

  describe 'POST /api/clans' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm' } }

    context 'when the request is valid' do
      before { post '/api/clans', params: valid_attributes }

      it 'creates a clan' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/clans' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /api/clans/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/api/clans/#{clan_id}", params: valid_attributes }

      it 'returns updated record' do
        expect(json['id']).to eq(clan_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/clans/:id' do
    before { delete "/api/clans/#{clan_id}" }

    it 'returns deleted clan record' do
      expect(json['id']).to eq(clan_id)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(200)
    end
  end
end