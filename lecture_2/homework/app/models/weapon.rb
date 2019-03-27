class Weapon < ApplicationRecord
    validates :name, presence: true

    belongs_to :attackable, polymorphic: true
end
