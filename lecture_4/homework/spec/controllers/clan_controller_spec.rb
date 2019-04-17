require 'rails_helper'

RSpec.describe ClanController, type: :controller do
  describe 'get one lcan' do
    context 'single clan' do
      let(:clan) { create(:clan) }
      it 'get single clan' do
        get :show, params: {id: clan.id}
        res = JSON.parse(response.body)
        expect(res.dig('name')).to eq(clan.name)
      end
    end
  end
end
