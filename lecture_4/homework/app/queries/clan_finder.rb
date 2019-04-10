class ClanFinder

  def initialize(params)
    @params = params
  end

  def run
    return Clan.find(@params[:clan_id]) if @params[:clan_id]
    Clan.first # What if no clan at all? 
  end

end
