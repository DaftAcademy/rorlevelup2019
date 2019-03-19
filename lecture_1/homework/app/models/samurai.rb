class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, presence: true, uniqueness: true
  validates :armor, presence: true, numericality: { only_integer: true },
              inclusion: { in:  0..1000 }
  validates :battles_count,  presence: true, numericality: { only_integer: true }

  def alive?
    death_date.nil?
  end
end
