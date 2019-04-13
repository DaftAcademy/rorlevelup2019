# frozen_string_literal: true

class WarriorsQuery
  def self.select_rarest_type_in_clan(clan)
    clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end
end
