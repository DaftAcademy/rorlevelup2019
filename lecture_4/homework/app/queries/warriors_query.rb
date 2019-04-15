class WarriorsQuery

  def self.find_class(clan:)
    clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end
end
