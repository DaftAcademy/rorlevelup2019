class Warrior < ApplicationRecord
    belongs_to :clan
    validates :name, presence: true
    validates :armour, numericality: { only_integer: true, greater_than: 0, less_than: 1000  }
    validates :battles, numericality: { only_integer: true }
    validates :join_date, presence: true
end
