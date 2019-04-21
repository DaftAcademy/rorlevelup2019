
  class WarriorSerializer < ActiveModel::Serializer
    attributes :id, :name, :defensible, :weapon, :attack

    def weapon
      d = object.weapon 
      if d.nil? then 
        return nil
      end
       { type: d.type,
        range: d.range,
        damage: d.damage}
     
    end

    def defensible
      d = object.defensible
       { type: d.class.table_name,
         name: d.name}
     
    end

  end
