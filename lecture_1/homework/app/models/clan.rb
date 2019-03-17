class Clan < ApplicationRecord
  has_many :samurai, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 50, :message => "Name should be between 2 and 50 signs"}
end
