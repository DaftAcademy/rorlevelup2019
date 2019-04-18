require 'rails_helper'

RSpec.describe ClanCreator, type: :controller do

    let(:clanCreator) {
        ClanCreator.new(Clan.all)
    }

    let(:validParams) {
        ActionController::Parameters.new({
            name: 'Miyagi'
        })
    }

    describe '#create' do 
        it 'creating clan with permitted params increases clan number by one' do
            validParams.permit!
            expect{clanCreator.create(validParams)}.to change{Clan.count}.by(1)
        end
    end

end
