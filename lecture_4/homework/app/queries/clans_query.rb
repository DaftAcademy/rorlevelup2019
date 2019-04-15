class ClansQuery

  def self.find_clan(clan_id: nil)
    if clan_id
      Clan.find(clan_id)
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
