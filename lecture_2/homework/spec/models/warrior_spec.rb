require 'rails_helper'

RSpec.describe Warrior, type: :model do
  subject(:warrior) { build :samurai, defensible_type: 'Barricade',
                                      defensible_id: 1, clan_id: 1 }

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

  describe 'name' do
    context 'when unique within alive members of a clan' do
      it 'is valid' do
        warrior.name = 'Sam Urai'
        expect(warrior).to be_valid
      end
    end

    context 'when non unique within alive members of a clan' do
      it 'is not valid' do
        warrior.name = 'Abe Masakatsu'
        expect(warrior).to_not be_valid
      end
    end

    context 'when equal to a name of a dead member of a clan' do
      it 'is valid' do
        warrior.name = 'Adachi Yasumori'
        expect(warrior).to be_valid
      end
    end

    context 'when equal to a name of a member of a different clan' do
      it 'is valid' do
        warrior.name = 'Abe Masakatsu'
        warrior.clan_id = 2
        expect(warrior).to be_valid
      end
    end
  end
end
