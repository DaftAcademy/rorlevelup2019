require 'rails_helper'

RSpec.describe Clan, model: :clan do
  let(:clan) { create(:clan) }

  it { should have_many(:samurais).dependent(:destroy) }

  context "New clan" do
    it "should be valid" do
      expect(clan).to be_valid
    end 
  end

  context "Clan without a name" do
    it "is invalid" do
      clan.name = ""
      expect(clan).to be_invalid
    end
  end
end
