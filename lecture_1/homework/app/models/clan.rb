class Clan < ApplicationRecord
  validates :name, presence: :true
  has_many :samurais, dependent: :destroy
end
