class ClanSerializer < ActiveModel::Serializer
  attributes :name, :warriors
  def warriors
    object.warriors.map do |warrior|
      {
        name: warrior.name,
        type: warrior.type}
      end
  end

end
