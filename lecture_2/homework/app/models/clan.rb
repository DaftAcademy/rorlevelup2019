class Clan < ApplicationRecord
  has_many :characters, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
