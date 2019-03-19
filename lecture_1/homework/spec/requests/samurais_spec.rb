require "rails_helper"

RSpec.describe "Samurais management", type: :request do
  let(:clan) { create(:clan) }
  let(:samurai) { create(:samurai) }
  let(:params) { FactoryBot.attributes_for(:samurai) }

  it "lists all Samurais" do
    get api_v1_clan_samurais_path(clan.id)
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  context "with valid params" do
    it "creates a Samurai" do
      post api_v1_clan_samurais_path(clan.id), params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:created)
    end

    it "updates the Samurai" do
      put "/api/v1/clans/#{clan.id}/samurais/#{samurai.id}",
          params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end

  %i[name armor battles].each do |attr|
    context "without #{attr}" do
      it "does not create the Samurai" do
        params[attr] = nil
        post "/api/v1/clans/#{clan.id}/samurais", params: params
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context "with invalid params" do
    it "does not create a Samurai" do
      params[:battles] = Faker::Name.name
      post "/api/v1/clans/#{clan.id}/samurais", params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "does not update the Samurai" do
      params[:battles] = -1
      put "/api/v1/clans/#{clan.id}/samurais/#{samurai.id}",
          params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "when the Samurai id is found" do
    it "destroys the Samurai" do
      delete "/api/v1/clans/#{clan.id}/samurais/#{samurai.id}"
      expect(response).to have_http_status(:no_content)
    end
  end

  context "when the Samurai id is not found" do
    it "does not destroy the Samurai" do
      delete "/api/v1/clans/#{clan.id}/samurais/9999"
      expect(response).to have_http_status(:not_found)
    end
  end
end
