# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :warrior

  enum kind: {
    magical: 'magical',
    melee: 'melee',
    ranged: 'ranged'
  }

  validate :validate_weapon

  private

  def validate_weapon
    errors.add(:warrior, :invalid, message: "can't use this kind of weapon") if unknown_weapon
  end

  def unknown_weapon
    warrior.weapon.kind != warrior.weapon_kind
  end
end
