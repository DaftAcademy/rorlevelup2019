class ClanSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :warriors_count

  def warriors_count
    self.object.warriors.length
  end

end
