require 'rails_helper'

RSpec.describe ClansController, type: :controller do

  describe "GET #index" do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { { name: 'Doodles' } }

      it "creates clan" do
        expect {
          post :create, params: valid_attributes
        }.to change(Clan, :count).by(1)
      end

      it "is successful" do
        post :create, params: valid_attributes
        expect(response).to be_successful
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { name: nil } }

      it "does not create clan" do
        expect{
          post :create, params: invalid_attributes
        }.to change(Clan, :count).by(0)
      end

      it "is not successful" do
        post :create, params: invalid_attributes
        expect(response).not_to be_successful
      end
    end
  end
end
