class Samurai < ApplicationRecord
    belongs_to :clan

    validates :name, presence: true, uniqueness: true
    validates :armor, presence: true, numericality: {greater_than: 0, less_than: 1000}
    validates :battles, numericality: {greater_than: 0}
    validates :start, presence: true
    validate :time_issue


    def time_issue
        return if death.nil? || start < death
        errors.add(:death, :invalid)
    end
end
