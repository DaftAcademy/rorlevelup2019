class SamuraisController < ApplicationController
        def index
         if params.has_key?(:alive)      
          @samrs=clan.samurais.where(died: nil)
         elsif params.has_key?(:dead)  
          @samrs=clan.samurais.where.not(died: nil)  
         else      
          @samrs=clan.samurais.all
         end
         render json: @samrs.to_json(), status: 200
        end

        def show
         begin
          render json: samurai.to_json(), status: 200
         rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
         end
        end



        def create
         begin
          sam = clan.samurais.create!(sam_params)
          render json: sam.to_json(), status: 200
         rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
         end      
        end
          
        def update
         begin
          samurai.update!(sam_params)
          render json: samurai.to_json(), status: 200
         rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
         end        
        end
          
        def destroy
         begin
          samurai.destroy!
          render head:204
         rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
         end  
        end

        private
        
        def clan
         @clan ||= Clan.find(params[:clan_id])
        end

        def samurai
         @samurai ||= clan.samurais.find(params[:id])
        end

        def sam_params
         params.permit(:name, :armor_quality, :joined, :died)
        end
end
