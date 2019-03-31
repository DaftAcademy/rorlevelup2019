class Clan < ApplicationRecord
  has_many :warriors, dependent: :destroy
  validates :name, presence: true, uniqueness: { conditions: -> { where("name != 'unnamed'") } }
end
