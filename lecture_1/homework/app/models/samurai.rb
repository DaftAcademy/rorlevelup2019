class Samurai < ApplicationRecord
    belongs_to :clan

    validates :name, presence: true, length: { maximum: 256 }
    validates :armour_quality, presence: true, numericality: { greater_than: 0, less_than_or_equal: 1000 }
end
