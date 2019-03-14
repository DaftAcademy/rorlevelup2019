class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy
end
