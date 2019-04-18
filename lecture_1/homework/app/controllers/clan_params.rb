class ClanParams
    def initialize(params)
        @clan_params = params.permit(:name)
    end

    def get
        return @clan_params
    end
end