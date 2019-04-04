class StrongholdSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :total_warriors_count

  def total_warriors_count
    self.object.warriors.length
  end
end
