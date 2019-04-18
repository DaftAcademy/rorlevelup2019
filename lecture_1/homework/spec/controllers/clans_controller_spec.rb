require 'rails_helper'

RSpec.describe ClansController, type: :request do

  let!(:clan) { create(:clan) }

  describe "GET /clans/:id" do
    before { get "/clans/#{clan.id}" }
    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response.body).not_to be_empty
    end
  end

  describe "GET /clans" do
    before { get '/clans' }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /clans" do
    before { post '/clans', params: { name: "klan odc 1231" } }
    it "returns created clan" do
      expect(JSON.parse(response.body)['name']).to eq("klan odc 1231")
    end

    it "returns 422 when invalid data" do
      post '/clans'
      expect(response).to have_http_status(422)
    end
  end

  describe "PUT /clans/:id" do
    before { put "/clans/#{clan.id}", params: { name: "klan odc 1233" }  }
    it "returns updated name" do
      expect(JSON.parse(response.body)['name']).to eq("klan odc 1233")
    end
  end

  describe "DELETE /clans" do
    before {
      post '/clans', params: { name: "klan odc 1231" }
      delete '/clans/2'
    }
    it "returns http no content" do
      expect(response).to have_http_status(204)
    end
  end

end
