# frozen_string_literal: true

class WarriorClassSelector
  attr_reader :clan
  def initialize(clan: Clan)
    @clan = clan
  end

  def run
    clan.warriors.select('type, count(type) as warriors_count')
        .group(:type)
        .order('warriors_count ASC')
        .first.class
  end
end
