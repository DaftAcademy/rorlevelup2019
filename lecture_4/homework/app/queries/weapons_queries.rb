# frozen_string_literal: true

class WeaponsQueries
  def self.create_katana(warrior:, relation:)
    relation.create!(warrior: warrior, range: 2, damage: 25)
  end

  def self.create_musket(warrior:, relation:)
    relation.create!(warrior: warrior, range: 40, damage: 10)
  end

  def self.create_magic_wand(warrior:, relation:)
    relation.create!(warrior: warrior, range: 20, damage: 45)
  end
end
