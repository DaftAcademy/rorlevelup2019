require 'rails_helper'

RSpec.describe Warriors::Samurai, type: :model do

  let(:warrior) { described_class.new(name: "Janosig", clan: nil, building: nil) }

  describe 'Can fight undependent from weapon' do

    context 'with weapon' do
      it 'attack with weapon name' do
        warrior.weapon = Weapons::Katana.new(range: 3, damage: 30)
        expect(warrior.attack).to eql('Samurai Janosig attacked with Katana')
      end
    end

    context 'without weapon' do
      it 'attack with bare hands' do
        expect(warrior.attack).to eql('Samurai Janosig attacked with bare hands')
      end
    end

  end

end
