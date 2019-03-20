require 'rails_helper'

RSpec.describe 'Samurais API' do
  let!(:clan) { create(:clan) }
  let!(:samurais_alive) { create_list(:samurai, 12, clan_id: clan.id) }
  let!(:samurais_dead) { create_list(:samurai, 8, clan_id: clan.id, died_at: DateTime.now)}
  let(:clan_id) { clan.id }
  let(:id) { samurais_alive.first.id }

  describe 'GET /clans/:clan_id/samurais' do
    context 'when clan exists' do
      before { get "/clans/#{clan_id}/samurais" }

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return all samurais' do
        expect(json.size).to eq(20)
      end
    end

    context 'when request param alive has value true' do
      before { get "/clans/#{clan_id}/samurais?alive=true" }

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return alive samurais' do
        expect(json.size).to eq(12)
      end
    end

    context 'when request param alive has value false' do
      before { get "/clans/#{clan_id}/samurais?alive=false" }

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return dead samurais' do
        expect(json.size).to eq(8)
      end
    end

    context 'when request param alive has incorrect value' do
      before { get "/clans/#{clan_id}/samurais?alive=wrong" }

      it 'should return status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'should return a not found message' do
        expect(response.body).to match(/Validation failed: Alive param should have boolean value/)
      end
    end

    context 'when clan does not exist' do
      before { get "/clans/#{clan_id}/samurais" }

      let(:clan_id) { 0 }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match(/Couldn't find Clan/)
      end
    end
  end

  describe 'GET /clans/:clan_id/samurais/:id' do
    before { get "/clans/#{clan_id}/samurais/#{id}" }

    context 'when clan samurai exists' do
      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return the samurai' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when clan samurai does not exist' do
      let(:id) { 0 }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match(/Couldn't find Samurai/)
      end
    end
  end

  describe 'POST /clans/:clan_id/samurais' do
    let(:valid_attributes) { { name: 'Samurai Jack', armor_quality: 1000, battle_count: 93 } }

    context 'when request attributes are valid' do
      before { post "/clans/#{clan_id}/samurais", params: valid_attributes }

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/clans/#{clan_id}/samurais", params: {} }

      it 'should return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'should return a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /clans/:clan_id/samurais/:id' do
    let(:valid_attributes) { { name: 'Samurai Nojack' } }

    before { put "/clans/#{clan_id}/samurais/#{id}", params: valid_attributes }

    context 'when samurai exists' do
      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should update the samurai' do
        updated_samurai = Samurai.find(id)
        expect(updated_samurai.name).to match(/Samurai Nojack/)
      end
    end

    context 'when the samurai does not exist' do
      let(:id) { 0 }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match(/Couldn't find Samurai/)
      end
    end
  end

  describe 'DELETE /clans/:clan_id/samurais/:id' do
    before { delete "/clans/#{clan_id}/samurais/#{id}" }

    it 'should return status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end