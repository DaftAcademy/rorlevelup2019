# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  describe 'GET /buildings' do
    subject { get '/buildings' }

    it 'responds with 200' do
      subject
      expect(response).to have_http_status(200)
    end

    context 'when there are no buildings' do
      it 'return "There are no buildings" message' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['message']).to include('There are no buildings')
      end
    end

    context 'with existing buildings' do
      before { create_list(:building, 4) }

      it 'responds with 200' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'includes building data' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['data'].size).to eq(4)
      end
    end
  end
end
