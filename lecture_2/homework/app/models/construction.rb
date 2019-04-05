class Construction < ApplicationRecord
  has_many :warriors

  validates :name, presence: true
end
