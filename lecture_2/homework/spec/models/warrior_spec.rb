require 'rails_helper'

RSpec.describe Warrior, type: :model do
  let(:clan) { create :clan }
  let(:barricade) { create :barricade }
  subject(:warrior) { clan.warriors.create! attributes_for :samurai,
                                            defensible: barricade }
  it { is_expected.to be_valid }
  it { is_expected.to belong_to :clan }
  it { is_expected.to belong_to :defensible }

  context 'when defensible id does not exist' do
    it 'is not valid' do
      warrior.defensible_id = -1
      expect(warrior).to_not be_valid
    end
  end

  context 'when warrior type does not exist' do
    it 'is not valid' do
      warrior.type = nil
      expect(warrior).to_not be_valid
    end
  end
end
