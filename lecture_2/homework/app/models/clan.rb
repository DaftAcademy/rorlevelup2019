class Clan < ApplicationRecord
  has_many :warriors, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  delegate :hussars, :archers, :samurais, to: :warriors
end
