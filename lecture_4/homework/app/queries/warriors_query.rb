class WarriorsQuery

  def self.find_type(relation: Warrior)
    clan = ClanFinder.new(warrior.id).run
    clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end

end
