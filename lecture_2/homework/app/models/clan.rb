class Clan < ApplicationRecord
  # attr_accessor :id, :name
  has_many :warriors, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
