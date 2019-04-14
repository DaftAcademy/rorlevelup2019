# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClansController, type: :controller do
  describe 'get one lcan' do
    context 'single clan' do
      let(:clan) { create(:clan) }
      it 'get single clan' do
        get "clans/#{clan.id}"
        res = JSON.parse(response.body)
        expect(res.dig('name')).to eq(clan.name)
      end
    end
  end
end
