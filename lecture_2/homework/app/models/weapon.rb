class Weapon < ApplicationRecord
  belongs_to :weaponable, polymorphic: true
end
