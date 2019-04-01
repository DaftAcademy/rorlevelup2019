class Warrior < ApplicationRecord
  belongs_to :clan
  belongs_to :defensible, polymorphic: true, optional: true
  has_one :weapon, dependent: :nullify
  validate :can_use?
  validates :name, presence: true, uniqueness: { scope: :clan_id }, if: Proc.new { |w| w.is_death? }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }

  def can_use?
    if self.weapon != nil
      if self.style != weapon.kind
        errors.add(:weapon, "warrior style must be same as weapon kind")
        self.weapon = nil
      end
    end
    # Return true if can use weapon
    true
  end

  def is_death?
    !(self.death_date)
  end

  # Should be ovveride inside inheriting classes | or virtual?
  def attack
    "Fight with bare hands"
  end

  def style
    :melee
  end

end
