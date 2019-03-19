class Clan < ApplicationRecord
  has_many :samurais
  validates :name, presence: true, uniqueness: true
end
