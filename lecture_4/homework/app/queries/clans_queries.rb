# frozen_string_literal: true

class ClansQueries
  def self.find(clan_id:, relation: Clan)
    if clan_id
      relation.find(clan_id)
    else
      relation.order(warriors_count: :desc).first
    end
  end

  def self.all_clans(relation: Clan)
    relation.all
  end

  def self.create_clan(clan_params:, relation: Clan)
    relation.create!(clan_params)
  end
end
