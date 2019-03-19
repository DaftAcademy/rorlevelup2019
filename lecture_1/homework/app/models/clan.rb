class Clan < ApplicationRecord
  validates :name, presence: true
end
