class Clan < ApplicationRecord
    has_many :samurais

    validates :name, presence: true, length: { maximum: 256 }
end
