# frozen_string_literal: true

class ClanFindService
  attr_reader :clan_id

  def initialize(clan_id)
    @clan_id = clan_id
  end

  def call
    clan_id ? Clan.find(@clan_id) : Clan.order(warriors_count: :desc).first
  end
end
