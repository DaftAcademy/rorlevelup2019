class WarriorsController < ApplicationController
    
  def index
     if params.has_key?(:alive)      
      warrior=clan.warriors.where(died: nil)
     elsif params.has_key?(:dead)  
      warrior=clan.warriors.where.not(died: nil)  
     else      
      warrior=clan.warriors.all
     end
     render json: warrior
    end

    def show
      render json: warrior, include: 'clan', include: 'defensible' ,include: 'weapon' 
    end



    def create
      warrior = clan.warriors.create!(wars_params)
      render json: warrior, include: 'clan' 
    end
      
    def update
     begin
      warrior.update!(wars_params)
      render json: warrior, include: 'clan'
     end        
    end
      
    def destroy
     begin
      warrior.destroy!
      render head:204
     end  
    end

    private
    
    def clan
     @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
     @warrior ||= clan.warriors.find(params[:id])
    end

    def wars_params
     params.permit(:name, :armor_quality, :join_date, :death_date)
    end
end