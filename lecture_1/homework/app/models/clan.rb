class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy
  validates :name, presence: true, length: { maximum: 64 }
end
