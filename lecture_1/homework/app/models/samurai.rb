class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, :battles, :join_date, presence: true
  validates :armour, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  scope :dead, -> {where("death_date is not null")}
  scope :alive, -> {where("death_date is null")}
end
