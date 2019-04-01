class Weapon < ApplicationRecord
    validates :kind, presence: true
    validates :damage, presence: true, :numericality => { only_integer: true, :greater_than_to => 0 }
    validates :range, presence: true, :numericality => { only_integer: true, :greater_than => 0 }
end
