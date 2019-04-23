# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe MercenariesController do
  describe 'POST employ_best' do
    before(:each) do
      @clan = create(:clan)
      @warrior = create(:warrior, name: 'Ardian')
      @mercenary = create(:mercenary, name: 'Franz')
    end

    it 'returns marcenary object' do
      post :employ_best
      expect(response.body).to include('Franz')
    end
  end
end
