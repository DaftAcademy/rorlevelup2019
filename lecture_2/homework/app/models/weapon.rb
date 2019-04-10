class Weapon < ApplicationRecord
  belongs_to :warrior
  validate :is_this_apropriate_weapon
  validates :range, :damage, :species, presence: true
  validates :species, inclusion: { in: %w( Magical Melee Ranged) }

  def is_this_apropriate_weapon
    if self.warrior
      if self.warrior.equipment != species
        self.errors.add(:species, "This weapon cannot be used by this Warrior")
      end
    end
  end
end
