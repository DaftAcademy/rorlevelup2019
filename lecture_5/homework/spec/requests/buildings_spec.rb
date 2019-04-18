# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  describe 'GET /buildings' do
    context 'when there are no buildings' do
      it 'responds with 200' do
        get '/buildings'
        expect(response).to have_http_status(200)
      end
    end

    context 'with existing buildings' do
      before { FactoryBot.create_list(:building, 4) }

      it 'responds with 200' do
        get '/buildings'
        expect(response).to have_http_status(200)
      end
    end
  end
end
