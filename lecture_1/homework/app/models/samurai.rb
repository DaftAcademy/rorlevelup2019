class Samurai < ApplicationRecord
    belongs_to :clan

    validates :armor_quality, presence: true, numericality: { greater_then: 0, less_then: 1001}
    validates :name, presence: true, length: { maximum:50 }
end
