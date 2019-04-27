# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Buildings API', type: :request do
  describe 'GET /buildings' do
    subject { get '/buildings' }

    it 'responds with 200' do
      subject
      expect(response).to have_http_status(200)
    end

    context 'when there are no Buildings' do
      it 'return "There are no buildings" message' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['message']).to include('There are no buildings')
      end
    end

    context 'with existing Buildings' do
      before { create_list(:building, 4) }

      it 'responds with 200' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'includes Building data' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['data'].size).to eq(4)
      end
    end
  end

  describe 'GET /buildings/:id' do
    let(:building_id) { 1 }
    subject { get "/buildings/#{building_id}" }

    context 'when Building is not found' do
      it 'responds with 404' do
        subject
        expect(response).to have_http_status(404)
      end

      it 'includes the "Couldn\'t find Building with \'id\'=1" message' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['error']).to include("Couldn't find Building with 'id'=1")
      end
    end

    context 'when Building is found' do
      before { create(:building, id: building_id, name: 'Building_1') }

      it 'responds with 200' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'returns data of Building with id = 1' do
        subject
        response_json = JSON.parse(response.body)
        expect(response_json['data']).to include(
          'id' => building_id.to_s,
          'attributes' => {
            'name' => 'Building_1',
            'siege-ability' => 0
          }
        )
      end
    end
  end
end
