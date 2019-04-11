# frozen_string_literal: true

class EmployService
  def initialize(params)
    @clan_id = params[:clan_id]
    @action = params[:action]
    @id = params[:id]
    @building_id = params[:building_id]
  end

  def run
    mercenary = MercenaryFinder.new(@action, @id).call
    clan = ClanFinder.new(@clan_id).call
    building = BuildingFinder.new(@building_id).call
    SetWarrior.new(mercenary, clan, building).set
  end

  # 1. Stworzenie Service Object, ktory "odciazy" mercenaries_controler (ale brak pewnosci czy
  #     tak moze to byc...).
  # 2. Podzial metod tak, aby utworzone klasy w miare mozliwosci spelnialy zasade Single
  #     Responsibility wraz z przekazaniem tylko tych parametrow,
  #     ktore im sa niezbedne do dzialania.
  # 3. DRY - EmployService obsluguje akcje employ_best oraz employ,
  #     ale nie wiem czy jest to sluszna koncepcja
end
