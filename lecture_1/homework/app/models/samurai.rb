class Samurai < ApplicationRecord
    belongs_to :clan

    validates :armour, presence: true, numericality: { greater_than: 0, less_than: 1001}
    validates :name, presence: true, length: { maximum: 256}
    validates :battle_counter, presence: true, numericality: {greater_than: -1}
end
