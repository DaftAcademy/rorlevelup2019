class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
