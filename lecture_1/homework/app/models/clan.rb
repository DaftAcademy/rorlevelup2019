class Clan < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
