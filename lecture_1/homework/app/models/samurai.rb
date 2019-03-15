class Samurai < ApplicationRecord
    belongs_to :clan

    validates :name, presence: true, length: { maximum: 256 }
    validates :armor, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
    validates :battles, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :join_date, presence: true
    validate :death_date_after_join_date

    def death_date_after_join_date
        return if death_date == nil
        if death_date < join_date
            errors.add(:death_date, "can't be before join date")
        end
    end

end