class Samurai < ApplicationRecord
  belongs_to :clan

  validates :name, presence: true, length: { maximum: 256 }
  validates :armor, presence: true,
                    numericality: { greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 1000 }
  validates :battle_count, presence: true
  validates :join_at, presence: true
  validates :clan_id, presence: true
end
