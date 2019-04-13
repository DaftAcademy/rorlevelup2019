class BuildingsQuery
    def self.find_building(params)
        if params[:building_id]
            Building.find(params[:building_id])
        else
            #NullObj
        end
    end
end