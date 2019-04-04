class Weapon < ApplicationRecord
  has_one :warrior, as: :equipment

  validates :name, presence: true
  validates :damage, presence: true, numericality: { only_integer: true }, inclusion: { :in => 1..10, :message => "Damage should be integer between 1 and 10" }
  validates :range, presence: true, numericality: { only_integer: true }
end
