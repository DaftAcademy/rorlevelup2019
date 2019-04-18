# frozen_string_literal: true

class ClanFinder
  def initialize(clan_id)
    @clan_id = clan_id
  end

  def call
    if @clan_id
      Clan.find(@clan_id)
    else
      Clan.order(warriors_count: :desc).last
    end
  end
end
