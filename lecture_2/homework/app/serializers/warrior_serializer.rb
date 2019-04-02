class WarriorSerializer < ApplicationSerializer

  attributes :name, :armor_quality, :number_of_battles
  belongs_to :clan, record_type: :clan
  has_one :weapon
end
