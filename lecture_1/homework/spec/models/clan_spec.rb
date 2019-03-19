require "rails_helper"

RSpec.describe Clan, type: :model do
  let(:clan) { create :clan }
  subject { clan }

  it { is_expected.to be_valid }

  it { is_expected.to have_many(:samurais) }

  describe "database columns" do
    it { is_expected.to have_db_column(:name) }
  end

  context "without a name" do
    it "is not valid" do
      clan.name = nil
      expect(clan).to_not be_valid
    end
  end

  context "with name.length above 64" do
    it "is not valid with a name too long" do
      clan.name = Faker::Lorem.characters(65)
      expect(clan).to_not be_valid
    end
  end
end
