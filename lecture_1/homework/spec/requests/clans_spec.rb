require 'rails_helper'

RSpec.describe 'Clans' do
  let(:clan) { create(:clan)}
  let(:clan2) { create(:clan, name:"other clan") }

  describe 'GET /clans' do
    before { get '/clans'}

    context 'when clans exist' do
      it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end
  end

  describe 'POST /clans' do
    context 'with valid params' do
      it 'returns status 201' do
        post '/clans', params:{name: "dfsfdsfa"}
        expect(response).to have_http_status(201)
      end
    end
  end
end
