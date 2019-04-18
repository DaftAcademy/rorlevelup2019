class ClansCreator
    def initialize(clan_params)
        @params = clan_params
    end

    def call
        create_clan(@params)
    end

    def create_clan(params)
        @clan = Clan.create!(params)
    end
end