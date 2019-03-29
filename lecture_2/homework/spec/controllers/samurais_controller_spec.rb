require 'rails_helper'

RSpec.describe Clans::SamuraisController, type: :controller do
  let(:clan) { create(:clan) }
  let(:samurai) { create(:samurai, clan_id: clan.id)}

  let(:request_params) { { clan_id: samurai.clan_id, id: samurai.id } }


  describe "GET #index" do
    it "is successful" do
      get :index, params: request_params
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "is successful" do
      get :show, params: request_params
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) {
        {
          name: "Danny",
          armor_quality: 53,
          number_of_battles: 13,
          join_date: "1961-08-21",
          death_date: nil,
          clan_id: clan.id
        }
      }

      it "creates samurai" do
        expect{
          post :create, params: valid_attributes
        }.to change(Samurai, :count).by(1)
      end

      it "is successful" do
        post :create, params: valid_attributes
        expect(response).to be_successful
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) {
        {
          name: nil,
          armor_quality: 53,
          number_of_battles: 13,
          join_date: "1961-08-21",
          death_date: nil,
          clan_id: clan.id
        }
      }

      it "does not create samurai" do
        expect{
          post :create, params: invalid_attributes
        }.to change(Samurai, :count).by(0)
      end

      it "is not successful" do
        post :create, params: invalid_attributes
        expect(response).not_to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      let(:new_request_params) { request_params.merge(name: "Danny Boy") }

      before(:each) do
        put :update, params: new_request_params
        samurai.reload
      end

      it "updates samurai" do
        expect(samurai.name).to eq(new_request_params[:name])
      end

      it "is successful" do
        expect(response).to be_successful
      end
    end

    context "with invalid attributes" do
      let(:new_request_params) { request_params.merge(name: nil) }

      before(:each) do
        put :update, params: new_request_params
        samurai.reload
      end

      it "does not update samurais" do
        expect(samurai.name).not_to be_nil
      end

      it "is not successful" do
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:samurai) { create(:samurai, clan_id: clan.id) }

    it "deletes samurai" do
      expect {
        delete :destroy, params: { clan_id: samurai.clan_id, id: samurai.id}
      }.to change(Samurai, :count).by(-1)
    end
  end
end
