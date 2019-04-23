# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.clean_with :truncation

RSpec.describe MercenariesController do
  describe 'POST employ' do
    before do
      @clan = create(:clan, name: 'Zaibatsu')
      @warrior = create(:warrior, name: 'Donald', preferred_weapon_kind: 'ranged')
      @mercenary = create(:mercenary, name: 'Roger')
    end

    it 'returns marcenary object' do
      post :employ_best
      expect(response.body).to include('Roger')
    end
  end
end
