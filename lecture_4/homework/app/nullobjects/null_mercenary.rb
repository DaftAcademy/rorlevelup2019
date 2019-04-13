class NullMercenary
    attr_accessor :experience
    attr_accessor :name
    attr_accessor :price
    attr_accessor :preferred_weapon_kind
    attr_accessor :available_from
    attr_accessor :created_at
    attr_accessor :updated_at
    attr_accessor :warrior
    attr_accessor :warrior_id
    def initialize params
        self.warrior = nil
        self.warrior_id = nil
        self.experience = 0
        self.name = "unknow"
        self.price = 0 
        self.preferred_weapon_kind = "melee"
        self.available_from = Time.now 
        self.created_at = Time.now
        self.updated_at = Time.now
        if params.key?(:name)
            self.name = params[:name]
        end
        if params.key?(:preferred_weapon_kind)
            self.preferred_weapon_kind = params[:preferred_weapon_kind]
        end
    end
end