class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy

  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z \.']+\z/ },
                   length: { maximum: 80 },
                   uniqueness: true
end
