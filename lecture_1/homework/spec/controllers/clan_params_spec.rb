require 'rails_helper'
require 'json'

RSpec.describe ClanParams do
    describe '#initialize' do
        it 'params json with all acceptable tags is fully permitted' do
            params = ActionController::Parameters.new({
                name: 'Miyagi'
            })
            clan_params = ClanParams.new(params).get
            expect(clan_params.to_s).to eq('{"name"=>"Miyagi"}')
        end
        it 'unacceptable tags arent present in clan params' do
            params = ActionController::Parameters.new({
                name: 'Miyagi',
                doggy: 'Puggo'
            })
            clan_params = ClanParams.new(params).get
            expect(clan_params.to_s).to eq('{"name"=>"Miyagi"}')
        end
    end
end
