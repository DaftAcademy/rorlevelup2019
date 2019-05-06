class Weapon < ApplicationRecord
  KINDS = %w[Melee Magical Ranged]

  belongs_to :warrior

  validates :type, inclusion: { in: KINDS }
  validates :damage, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validate :correct_weapon

  private

  def correct_weapon
    unless warrior.weapon_type == warrior.weapon.type
      errors.add(:warrior, :invalid, message: "can't fight with this weapon")
    end
  end

end
