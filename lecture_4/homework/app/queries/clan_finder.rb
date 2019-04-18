# frozen_string_literal: true

class ClanFinder
  attr_reader :params
  def initialize(params:)
    @params = params
  end

  def run
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
