# frozen_string_literal: true

class ClanFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_clan
  end

  private

  attr_reader :params

  def find_clan
    ClansQueries.find(clan_id: params)
  end
end
