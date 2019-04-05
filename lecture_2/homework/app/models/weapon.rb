class Weapon < ApplicationRecord
  belongs_to :warrior, optional: true
end
