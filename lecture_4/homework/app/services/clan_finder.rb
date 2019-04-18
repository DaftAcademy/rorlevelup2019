# frozen_string_literal: true

class ClanFinder
  def initialize(clan_id)
    @clan_id = clan_id
  end

  def call
    find_clan
  end

  private

  attr_reader :clan_id

  def find_clan
    if @clan_id
      Clan.find(@clan_id)
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
