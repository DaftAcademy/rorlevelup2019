# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class WarriorClassService
  def initialize(clan)
    @clan = clan
  end

  def run
    warrior_select.group(:type).order('warriors_count ASC').first.class
  end

  private

  def warrior_select
    @clan.warriors.select('type, count(type) as warriors_count')
  end
end
