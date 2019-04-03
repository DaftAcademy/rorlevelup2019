require 'rails_helper'

RSpec.describe Clan, model: :clan do
  let(:clan) { create(:clan) }

  it { should have_many(:samurais).dependent(:destroy) }
  it { should validate_uniqueness_of(:name) }

  context "Clans should have name" do
    it "is valid" do
      expect(clan).to be_valid
    end

    it "is invalid with a duplicated name" do
      clan.name = "right proper lads"
      expect(clan).to be_invalid
    end
  end
end
