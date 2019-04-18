require 'rails_helper'

RSpec.describe Clan, type: :model do
  describe "validations" do
    it { should have_many(:samurais).dependent(:destroy) }
    it { should validate_presence_of :name }
  end
end
