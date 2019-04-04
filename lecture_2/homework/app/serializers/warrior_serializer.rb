class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :clan
  attribute :warrior_attack
  has_one :weapon
  belongs_to :defensible

  def warrior_attack
   self.object.attack
  end
end
