class WarriorsCreator
    def initialize(clan, warrior_params)
        @clan = clan
        @params = warrior_params
    end

    def call
        create_warrior(@params)
    end

    def create_warrior(params)
        @warrior = @clan.warriors.create!(params)
    end
end