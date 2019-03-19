class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, minimum: 2, maximum: 256
end
