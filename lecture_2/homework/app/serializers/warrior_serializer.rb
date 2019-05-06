class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :attack
  belongs_to :equipment
  belongs_to :defensible

  def attack
    self.object.attack
  end
end
