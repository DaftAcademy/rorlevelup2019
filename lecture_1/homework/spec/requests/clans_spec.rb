require "rails_helper"

RSpec.describe "Clans management", type: :request do
  it "lists all Clans" do
    get api_v1_clans_path
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  context "with valid params" do
    it "creates a Clan" do
      params = FactoryBot.attributes_for(:clan)
      post api_v1_clans_path, params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:created)
    end
  end

  context "without valid params" do
    it "does not create a Clan" do
      params = {}
      post api_v1_clans_path, params: params
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
