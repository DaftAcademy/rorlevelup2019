# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clan, type: :model do
  subject(:clan) { build(:clan) }

  describe '#validation' do
    it 'should be valid' do
      expect(clan).to be_valid
    end

    it 'should have name' do
      expect(clan.name).not_to be_empty
    end

    context 'empty name' do
      before { clan.name = nil }

      it 'should be invalid' do
        expect(clan).to be_invalid
      end

      it 'should have no name' do
        expect(clan.name).to eq(nil)
      end
    end
  end
end