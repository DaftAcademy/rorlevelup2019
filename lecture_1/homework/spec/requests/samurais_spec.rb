require 'rails_helper'

RSpec.describe 'Samurais API' do
  let!(:clan) { create(:clan) }
  let!(:samurais) { create_list(:samurai, 20, clan_id: clan.id) }
  let(:clan_id) { clan.id }
  let(:id) { samurais.first.id }

  describe 'GET /api/clans/:clan_id/samurais' do
    before { get "/api/clans/#{clan_id}/samurais" }

    context 'when clan exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all clan samurais' do
        expect(json.size).to eq(20)
      end
    end

    context 'when clan does not exist' do
      let(:clan_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Clan/)
      end
    end
  end

  describe 'GET /api/clans/:clan_id/samurais/:id' do
    before { get "/api/clans/#{clan_id}/samurais/#{id}" }

    context 'when clan samurai exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the samurai' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when clan samurai does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Samurai/)
      end
    end
  end

  describe 'POST /api/clans/:clan_id/samurais' do
    let(:valid_attributes) { { name: 'Visit Narnia' } }

    context 'when request attributes are valid' do
      before { post "/api/clans/#{clan_id}/samurais", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/clans/#{clan_id}/samurais", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /api/clans/:clan_id/samurais/:id' do
    let(:valid_attributes) { { name: 'Mozart', death_date: '2019-03-03', join_date: '2019-04-04', armor_quality: 77, number_of_battles: 5, } }

    before { put "/api/clans/#{clan_id}/samurais/#{id}", params: valid_attributes }

    context 'when samurai exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the samurai' do
        updated_samurai = Samurai.find(id)
        expect(updated_samurai.name).to match(/Mozart/)
        expect(updated_samurai.death_date.to_s).to match(/2019-03-03/)
        expect(updated_samurai.join_date.to_s).to match(/2019-04-04/)
        expect(updated_samurai.armor_quality).to eq(77)
        expect(updated_samurai.number_of_battles).to eq(5)
      end

      it 'returns updated samurai' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when the samurai does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Samurai/)
      end
    end
  end

  describe 'DELETE /api/clans/:id' do
    before { delete "/api/clans/#{clan_id}/samurais/#{id}" }

    it 'returns deleted samurai' do
      expect(json['id']).to eq(id)
    end
 
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end