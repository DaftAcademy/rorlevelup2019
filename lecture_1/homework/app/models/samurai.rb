class Samurai < ApplicationRecord
  belongs_to :clan

  validates :name,    presence: true,
                      format: { with: /\A[0-9a-zA-Z \.\']+\z/ },
                      length: { maximum: 50 },
                      uniqueness: true
  validates :combats, presence: true,
                      numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0 }
  validates :armor,   presence: true,
                      numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 1000 }
  validates :joined,  presence: true

  scope :alive, -> { where(died: nil) }
  scope :dead, -> { where.not(died: nil) }
end
