# frozen_string_literal: true

module Reports
  class SiegeReport
    def self.call(building:)
      # this should stop the method if getting null
      return unless building

      # bulding cant be defended without warriors
      if building.warriors.any?
        warriors_count = building.warriors.where(type: 'Warriors::Samurai').count
        hussar_count = building.warriors.where(type: 'Warriors::Hussar').count
        total_rice_need = warriors_count + hussar_count * 2 + building.default_rice_need
        siege_ability = building.granary / total_rice_need
        building.siege_ability = siege_ability
      else
        building.siege_ability = 0
      end
      building.save!
    end
  end
end
