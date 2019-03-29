class Clan < ApplicationRecord
  has_many :warriors, dependent: :destroy
  validates :name, presence: true
end
