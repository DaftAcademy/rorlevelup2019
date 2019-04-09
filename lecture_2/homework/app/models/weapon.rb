class Weapon < ApplicationRecord
  belongs_to :warrior

  enum kind: {
      magical: "magical",
      melee: "melee",
      ranged: "ranged"
  }

  validate :validate_weapon

  private

  def validate_weapon
    if warrior.weapon.kind != warrior.weapon_kind
      errors.add(:warrior, :invalid, message: "can't use this kind of weapon")
    end
  end
end
