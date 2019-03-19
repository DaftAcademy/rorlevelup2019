require 'rails_helper'

RSpec.describe 'Samurais' do
  let(:clan) { create(:clan)}
  let(:samurai) { create(:samurai, clan: clan) }
  let(:properties) { { name: "Jonnn", armor: 600, battles_count: 20,
        join_date: "2018-07-04", death_date: nil } }

  describe 'GET /clans/#{clan.id}/samurais/#{samurai.id}' do
    before { get "/clans/#{clan.id}/samurais/#{samurai.id}"}
    context 'when samurai exist' do
      it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end
  end

  describe 'GET /clans/#{clan.id}/samurais/' do
    before { get "/clans/#{clan.id}/samurais"}
    context 'when clan exist and has samurais' do
      it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end
  end

  describe 'POST /clans/#{clan.id}/samurais' do
    context 'with valid params' do
      it 'returns status 201' do
        post "/clans/#{clan.id}/samurais", params: properties
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /clans/#{clan.id}/samurais/#{samurai.id}' do
    context 'with valid params' do
      it 'returns status 200' do
        put "/clans/#{clan.id}/samurais/#{samurai.id}", params: {name: "update"}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /clans/#{clan.id}/samurais/#{samurai.id}' do
    context 'with existing samurai' do
      it 'returns status 204' do
        delete "/clans/#{clan.id}/samurais/#{samurai.id}", params: {name: "update"}
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'GET /clans/#{clan.id}/samurais/alive' do
    before { get "/clans/#{clan.id}/samurais/alive"}
    context 'when alive samurais exist' do
      it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end
  end

  describe 'GET /clans/#{clan.id}/samurais/dead' do
    before { get "/clans/#{clan.id}/samurais/dead"}
    context 'when dead samurais exist' do
      it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end
  end
end
