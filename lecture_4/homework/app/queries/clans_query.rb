class ClansQuery
    def self.find_clan(params)
        if params[:clan_id]
            Clan.find(params[:clan_id])
        elsif Clan.any?
            Clan.order(warriors_count: :desc).first
        else
            #NullObj
        end 
    end
end