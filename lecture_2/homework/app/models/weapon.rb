class Weapon < ApplicationRecord
    belongs_to :warrior
    validates :name, presence: true
    validates :damage, :range, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 10000 }
end
