class Clan < ApplicationRecord

  has_many :samurais, dependent: :destroy

  validates_presence_of :name

end
