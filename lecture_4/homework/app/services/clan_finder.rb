class ClanFinder
  attr_reader :clan_id
  def initialize(clan_id:)
    @clan_id = clan_id
  end

   def call
    if clan_id
      Clan.find(clan_id)
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
