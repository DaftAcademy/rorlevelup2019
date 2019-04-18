# frozen_string_literal: true

class Warrior < ApplicationRecord
  belongs_to :clan, counter_cache: true
  belongs_to :building, optional: true
  has_one :weapon, dependent: :destroy
  has_one :mercenary, dependent: :destroy

  validates :name, presence: true, uniqueness: { conditions: -> { where(death_date: nil) } }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :preferred_weapon_kind, presence: true, inclusion: { in: Weapon::KINDS }

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }

  # Wyjasnienie wprowadzonych zmian
  # 1. Przeniesienie metody attack do Warrior - zasada DRY --> przy duzej ilosci typow wojownikow
  #    ograniczy ona nam ilosc powtorzen niemal identycznego kodu
  # 2. Dodanie Null Object dla mercenary i metody attack

  def attack
    "#{type.demodulize} #{name} attacked with #{weapon_type.type.demodulize}"
  end

  def mercenary
    super || NoMercenary.new.show
  end

  private

  def weapon_type
    weapon || NoWeapon.new
  end
end
