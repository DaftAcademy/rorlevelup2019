# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildingsController, type: :controller do
  describe 'it get all buildings' do
    it 'responds with 200' do
      get 'index'
      expect(response).to have_http_status(200)
    end
  end

  describe 'it shows no building found' do
    it 'responds with 404' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(404)
    end
  end
end
