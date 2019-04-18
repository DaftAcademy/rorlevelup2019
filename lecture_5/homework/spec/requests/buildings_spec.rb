# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  subject { get '/buildings' }

  describe 'GET /buildings' do
    it 'responds with 200' do
      subject
      expect(response).to have_http_status(200)
    end
    context 'when there are no buildings' do
      it 'return "There are no buildings" message' do
        subject
        expect(response.body).to include('There are no buildings')
      end
    end

    context 'with existing buildings' do
      before { FactoryBot.create_list(:building, 4) }

      it 'responds with 200' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
