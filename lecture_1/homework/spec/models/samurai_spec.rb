require "rails_helper"

RSpec.describe Samurai, type: :model do
  let(:clan) { create :clan }
  subject(:samurai) { create :samurai, clan: clan }

  it { is_expected.to be_valid }

  it { is_expected.to belong_to(:clan) }

  describe "database columns" do
    it { should have_db_column :name }
    it { should have_db_column :armor }
    it { should have_db_column :battles }
    it { should have_db_column :died_at }
    it { should have_db_column :clan_id }
  end

  %i[name armor battles clan_id ].each do |attr|
    context "without #{attr}" do
      it "is not valid" do
        subject.assign_attributes(attr => nil)
        expect(subject).not_to be_valid
      end
    end
  end

  %i[armor battles].each do |attr|
    context "with #{attr} below 0" do
      it "is not valid" do
        subject.assign_attributes(attr => -1)
        expect(subject).not_to be_valid
      end
    end
  end

  %i[armor battles].each do |attr|
    context "when #{attr} equals 0" do
      it "is valid" do
        subject.assign_attributes(attr => 0)
        expect(subject).to be_valid
      end
    end
  end

  context "with armor above 1000" do
    it "is not valid" do
      samurai.armor = 1001
      expect(samurai).to_not be_valid
    end
  end

  context "when armor equals 1000" do
    it "is valid" do
      samurai.armor = 1000
      expect(samurai).to be_valid
    end
  end

  context "with clan_id that does not exist" do
    it "is not valid" do
      samurai.clan_id = 1787002
      expect(samurai).to_not be_valid
    end
  end

  context "with the name.length above 64" do
    it "is not valid" do
      samurai.name = Faker::Lorem.characters(65)
      expect(samurai).to_not be_valid
    end
  end
end
