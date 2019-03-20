module Api
  module V1
    class SamuraisController < ApplicationController  
      def index
        return render_all_samurais if params[:dead].blank?
        
        samurais = dead_or_alive

        render json: samurais.to_json(only: samurai_traits)
      end
      
      def show
        render json: samurai.to_json(only: samurai_traits)
      end

      def create
        samurai = clan.samurais.new(samurai_params)

        if samurai.save
          render json: samurai.to_json(only: samurai_traits), status: 201
        else
          render json: { errors: samurai.errors.messages }, status: 422
        end
      end

      def update
        if samurai.update!(samurai_params)
          render json: samurai.to_json(only: samurai_traits)
        else
          render json: { errors: samurai.errors.messages }, status: 422
        end
      end

      def destroy
        samurai.destroy!

        head 204
      end

      private

      def render_all_samurais
        render json: clan.samurais.to_json(only: samurai_traits)
      end

      def dead_or_alive
        params[:dead] == 'true' ? clan.samurais.dead : clan.samurais.alive
      end

      def samurai
        @samurai ||= clan.samurais.find(params[:id])
      end

      def clan
        @clan ||= Clan.find(params[:clan_id])
      end

      def samurai_params
        params.permit(:name, :armor, :battles, :join_date, :death_date, :clan_id)
      end

      def samurai_traits
        %i[id name armor battles join_date death_date clan_id]
      end
    end
  end
end
  