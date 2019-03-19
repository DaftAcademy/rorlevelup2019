require 'rails_helper'

RSpec.describe Clan, model: :clan do
  let(:clan) { create(:clan) }

  context "New clan" do
    it "should be valid" do
      expect(clan).to be_valid
    end 
  end
end
