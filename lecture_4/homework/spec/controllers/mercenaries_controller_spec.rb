# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MercenariesController, type: :controller do
  describe 'get all' do
    it 'renders index' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
