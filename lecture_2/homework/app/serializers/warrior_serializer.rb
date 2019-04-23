class WarriorSerializer < ApplicationSerializer
  attributes :name, :armort_quality, :number_of_battles
  belongs_to :clan, record_type: :clan
  has_one :weapon
end
