class WarriorParams
    def initialize(params)
        @warrior_params = params.permit(:name, :armor, :battles, :join_date, :death_date, :type, :weapon, :building_id,
            weapon_attributes: [:id, :damage, :range, :type])
    end

    def get
        return @warrior_params
    end
end
