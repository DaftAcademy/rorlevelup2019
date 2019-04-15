require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

RSpec.describe MercenariesController do
  describe "POST employ_best" do

    before do 
      @clan = create(:clan)
      @warrior = create(:warrior)
      @mercenary = create(:mercenary)
    end

    it "returns marcenary object" do
      post :employ_best
      expect(response.body). to include('Alfred')
    end
  end
end
