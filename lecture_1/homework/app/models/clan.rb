class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy
  validates :name,
    presence: true,
    uniqueness: true, 
    length: {in: 2..30}
end
