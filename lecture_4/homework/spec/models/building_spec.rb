# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Building, type: :model do
  subject(:wall) { Buildings::Walls.new(walls_params) }
  subject(:stronghold) { Buildings::Stronghold.new(stronghold_params) }

  describe '#validation stronghold' do
    context 'walls valid data' do
      let(:walls_params) { { name: 'cccc' } }

      it 'should be valid' do
        expect(wall).to be_valid
      end

      it 'should have name' do
        expect(wall.name).to eq('cccc')
      end
    end

    context 'stronghold valid data' do
      let(:stronghold_params) { { name: 'cccc' } }

      it 'should be valid' do
        expect(stronghold).to be_valid
      end

      it 'should have name' do
        expect(stronghold.name).to eq('cccc')
      end
    end

    context 'invalid params' do
      let(:stronghold_params) { { name: nil } }
      let(:walls_params) { { name: nil } }

      it 'stronghold should be valid' do
        expect(stronghold).to_not be_valid
      end

      it 'wall should be valid' do
        expect(wall).to_not be_valid
      end
    end
  end
end
