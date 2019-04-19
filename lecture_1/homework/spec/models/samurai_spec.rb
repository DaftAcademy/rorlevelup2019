require 'rails_helper'

RSpec.describe Samurai, type: :model do

  let(:samurai) { create(:samurai) }

  it { should belong_to(:clan) }
  
  context "New samurai" do 
    it "is valid" do 
      expect(samurai).to be_valid
    end 
  end
  
  context "Samurai without name" do 
    it "is invalid" do
      samurai.name = ""
      expect(samurai).to be_invalid 
    end
  end 

  context "Samurai armor" do 
    it "is invalid without presence" do 
      samurai.armor = nil
      expect(samurai).to be_invalid
    end 

    it "is invalid with wrong value" do
      samurai.armor = 3002
      expect(samurai).to be_invalid 
    end

    it "is invalid with float" do
      samurai.armor = 2.1
      expect(samurai).to be_invalid 
    end
  end 

  context "Fought battles" do
    it "is invalid without an integer" do
      samurai.fought_battles = nil
      expect(samurai).to be_invalid
    end

    it "is invalid with a float" do
      samurai.fought_battles = 2.1
      expect(samurai).to be_invalid
    end
  end 
end
